/* Copyright (c) 2018 Nicolas Van Bossuyt.                                    */
/* This code is licensed under the MIT License.                               */
/* See: LICENSE.md                                                            */

#include "kernel/physical.h"
#include "kernel/virtual.h"
#include "kernel/memory.h"
#include "kernel/logging.h"

page_directorie_t ALIGNED(kernel_page_dir, PAGE_SIZE);
page_table_t ALIGNED(kernel_page_tables[256], PAGE_SIZE);

void memory_init(uint kernel_end)
{
    for(size_t i = 0; i < 256; i++)
    {
        page_directorie_entry_t *entry = &kernel_page_dir.entries[i];
        entry->User = false;
        entry->Write = true;
        entry->Present = true;
        entry->PageFrameNumber = (uint)&kernel_page_tables[256] / PAGE_SIZE;
    }

    for(size_t i = 0; i < PAGE_ALIGN(kernel_end) / PAGE_SIZE; i++)
    {
        physical_used((void*)(i * PAGE_SIZE));
        virtual_map(&kernel_page_dir, (uint)(i * PAGE_SIZE), (uint)(i * PAGE_SIZE), false);
    }
    
    info("Memory: USED=%dk FREE=%dk TOTAL=%dk", physical_get_used() / 1024,  physical_get_free() / 1024,  physical_get_total() / 1024);
}

page_directorie_t * memory_construct_memory_space()
{
    
    

    for(size_t i = 0; i < 256; i++)
    {
        /* code */
    }

    return NULL;
    
}

void memory_detroy_memory_space(page_directorie_t * dir)
{
    UNUSED(dir);
}
