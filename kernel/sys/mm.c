#include <string.h>

#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/paging.h"

extern int __end;
extern int __start;
u32 ksbrk_top;

page_directorie_t * kernel_page_directorie;
page_table_t * kernel_page_tables[256]; // need 256 page table for the 1G reserved to the kernel

void mm_setup()
{
    // Set the kernel memory used so it's not used by other task
    for(size_t i = 0; i < ( PAGE_ALIGN((u32)&__end) / PAGE_SIZE); i++)
    {
        mem_frame_set_used((void *)(i * PAGE_SIZE));
    }

    // Allocate pagings structures.
    kernel_page_directorie = paging_new_page_directorie();

    debug("kernel size: %x(%x)", &__end, PAGE_ALIGN((u32)&__end));

    for(size_t i = 0; i < 256; i++)
    {
        kernel_page_tables[i] = paging_new_page_table();
        page_directorie_entry_t * entry = &kernel_page_directorie->entries[i];
        
        entry->Present = true;
        entry->Write = true;
        entry->User = false;
        entry->PageFrameNumber = (u32)(kernel_page_tables[i]) >> 12;

        paging_map(kernel_page_directorie, (u32)kernel_page_tables[i], (u32)kernel_page_tables[i], true, false);
    }
    
    for(size_t i = 0; i < ( PAGE_ALIGN((u32)&__end) / PAGE_SIZE); i++)
    {
        paging_map(kernel_page_directorie, i * PAGE_SIZE, i * PAGE_SIZE, true, false);
    }

    ksbrk_top = PAGE_ALIGN((u32)&__end);

    paging_load_directorie(kernel_page_directorie);
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
            paging_map(kernel_page_directorie, ksbrk_top, (u32)block, true, false);
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
            mem_frame_free(paging_get_physaddr(kernel_page_directorie, (void*)ksbrk_top));
            paging_unmap(kernel_page_directorie, ksbrk_top);
        }
     
        paging_invalidate_tlb();
        debug("kernel giveup %d pages", page_count);
        return 0;
    }

    return -1;
}