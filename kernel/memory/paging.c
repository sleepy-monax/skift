#include <string.h>

#include "cpu/cpu.h"

#include "kernel/memory.h"
#include "kernel/paging.h"
#include "kernel/logging.h"

void __mm_setup()
{
    memset(&kernel_page_directorie, 0,  sizeof(kernel_page_directorie));

    kernel_page_directorie.entries[0].Present = true;
    kernel_page_directorie.entries[0].Write = true;
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

page_directorie_t * paging_new_page_directorie()
{
    page_directorie_t * page_directorie = (page_directorie_t *)mem_frame_alloc();
    memset(page_directorie, 0, sizeof(page_directorie_t));
    return page_directorie;
}

void paging_free_page_directorie(page_directorie_t * page_directorie)
{
    mem_frame_free((void *)page_directorie);
}

page_table_t * paging_new_page_table_t()
{
    page_table_t * page_table = (page_table_t *)mem_frame_alloc();
    memset(page_table, 0, sizeof(page_table_t));
    return page_table;
}

void paging_free_page_table(page_table_t * page_table)
{
    mem_frame_free((void *)page_table);
}

void * paging_get_physaddr(page_directorie_t * pd, void * virtualaddr)
{
    u32 pdindex = (u32)virtualaddr >> 22;
    u32 ptindex = (u32)virtualaddr >> 12 & 0x03FF;

    page_directorie_entry_t* pd_entry = &pd->entries[pdindex];

    if (pd_entry->Present)
    {
        page_table_t * pt = (page_table_t *)(pd_entry->PageFrameNumber * PAGE_SIZE);
        page_t* page = &pt->pages[ptindex];

        if (page->Present)
        {
            void * physical = (void*)((page->PageFrameNumber & ~0xfff) + ((u32)virtualaddr & 0xfff));
        }
    }
    
    return NULL;
}

void paging_map(page_directorie_t * pd, u32 virtual, u32 physical, u32 flags)
{
    if (IS_PAGE_ALIGN(physical) && IS_PAGE_ALIGN(virtual))
    {
        debug("Mapping %x to %x.", virtual, physical);

        u32 pdindex = (u32)virtualaddr >> 22;
        u32 ptindex = (u32)virtualaddr >> 12 & 0x03FF;
    }
    else
    {
        panic("Cannot page map %x to %x, because it's not page aligned!", virtual, physical);
    }
}

void paging_unmap(page_directorie_t * page_directorie, u32 virtual)
{
    
}

