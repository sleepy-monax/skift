#include <string.h>

#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/paging.h"

extern int __end;
extern int __start;
u32 ksbrk_top;

page_directorie_t * kernel_pd;

void mm_setup()
{
    // Set the kernel memory used so it's not used by other task
    for(size_t i = 0; i < ( PAGE_ALIGN((u32)&__end) / PAGE_SIZE); i++)
    {
        mem_frame_set_used((void *)(i * PAGE_SIZE));
    }

    kernel_pd = paging_new_page_directorie();

    debug("kernel size: %x(%x)", &__end, PAGE_ALIGN((u32)&__end));

    for(size_t i = 0; i < ( PAGE_ALIGN((u32)&__end) / PAGE_SIZE); i++)
    {
        paging_map(kernel_pd, i * PAGE_SIZE, i * PAGE_SIZE, true, false);
    }

    ksbrk_top = PAGE_ALIGN((u32)&__end);

    paging_load_directorie(kernel_pd);
    paging_enable();
}

void * mm_kernel_acquire(size_t page_count)
{
    void * start = (void *)ksbrk_top;

    if (page_count > 0)
    {
        for(size_t i = 0; i < page_count; i++)
        {
            void* block = mem_frame_alloc();
            paging_map(kernel_pd, ksbrk_top, (u32)block, true, false);
            ksbrk_top += PAGE_SIZE;
        }
     
        paging_invalidate_tlb();
        debug("kernel acquire %d pages", page_count);
        return start;
    }

    return NULL;
}

int mm_kernel_giveup(size_t page_count)
{
    if (page_count > 0)
    {
        for(size_t i = 0; i < page_count; i++)
        {
            ksbrk_top -= PAGE_SIZE;
            mem_frame_free(paging_get_physaddr(kernel_pd, (void*)ksbrk_top));
            paging_unmap(kernel_pd, ksbrk_top);
        }
     
        paging_invalidate_tlb();
        debug("kernel giveup %d pages", page_count);
        return 0;
    }

    return -1;
}