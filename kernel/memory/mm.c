#include <string.h>

#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/paging.h"

extern int __end;

page_directorie_t * kernel_pd;

void mm_setup(int memory_size)
{
    // Set the kernel memory used so it's not used by other task
    kernel_pd = paging_new_page_directorie();

    for(size_t i = 0; i < ( PAGE_ALIGN((u32)&__end) / PAGE_SIZE); i++)
    {
        mem_frame_set_used((void *)(i * PAGE_SIZE));
        paging_map(kernel_pd, i * PAGE_SIZE, i * PAGE_SIZE, PAGE_PRESENT | PAGE_WRITE);
    }

    paging_load_directorie(kernel_pd);
    paging_enable();
}

page_directorie_t * create_task_page_directorie()
{
    page_directorie_t * pd = paging_new_page_directorie();
    //TODO: copy kernel pages.
    return pd;
}

void destroy_task_page_directorie(page_directorie_t * directorie)
{
    //TODO: destroy the page directory and free user pages.
}