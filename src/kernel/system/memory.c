#include "kernel/memory.h"

page_directorie_t ALIGNED(kernel_page_directorie, PAGE_SIZE);
page_table_t ALIGNED(kernel_page_table, PAGE_SIZE);

void mm_setup()
{
    memset(&kernel_page_directorie, 0, sizeof(kernel_page_directorie));

    kernel_page_directorie.entries[0].as_uint |= 3; // Present and Writable
    kernel_page_directorie.entries[0].as_uint |= (u32)&kernel_page_table;
    
    
    for(u32 i = 0; i < PAGE_TABLE_ENTRY_COUNT; i++)
    {
        kernel_page_table.pages[i].Present = true;
        kernel_page_table.pages[i].Supervisor = true;
        kernel_page_table.pages[i].PageFrameNumber = (i * PAGE_SIZE) >> 12;
    }
    
    paging_load_directorie(&kernel_page_directorie);
    paging_enable();
    info("Paging enabled!");
}