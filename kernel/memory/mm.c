#include <string.h>

#include "kernel/memory.h"
#include "kernel/paging.h"

extern int __end;

page_directorie_t * kernel_pd;

void mm_setup()
{
    // Set the kernel memory used so it's not used by other task
    for(size_t i = 0; i < ((u32)&__end / PAGE_SIZE); i++)
    {
        mem_frame_set_used((void *)(i * PAGE_SIZE));
    }
}
