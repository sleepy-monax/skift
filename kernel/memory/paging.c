#include <string.h>

#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/paging.h"


page_directorie_t * paging_new_page_directorie()
{
    page_directorie_t * page_directorie = (page_directorie_t *)mem_frame_alloc();
    memset(page_directorie, 0, sizeof(page_directorie_t));
    debug("New page directorie created at %x.", (u32)page_directorie);
    return page_directorie;
}


void paging_free_page_directorie(page_directorie_t * page_directorie)
{
    mem_frame_free((void *)page_directorie);
}


page_table_t * paging_new_page_table()
{
    page_table_t * page_table = (page_table_t *)mem_frame_alloc();
    memset(page_table, 0, sizeof(page_table_t));
    debug("New page table created at %x.", (u32)page_table);
    return page_table;
}


void paging_free_page_table(page_table_t * page_table)
{
    mem_frame_free((void *)page_table);
}


void * paging_get_physaddr(page_directorie_t * pd, void * virtual)
{
    u32 pdindex = (u32)virtual >> 22;
    u32 ptindex = (u32)virtual >> 12 & 0x03FF;

    page_directorie_entry_t* pd_entry = &pd->entries[pdindex];

    if (pd_entry->Present)
    {
        page_table_t * pt = (page_table_t *)(pd_entry->PageFrameNumber * PAGE_SIZE);
        page_t* page = &pt->pages[ptindex];

        if (page->Present)
        {
            void * physical = (void*)((page->PageFrameNumber & ~0xfff) + ((u32)virtual & 0xfff));
            return physical;
        }
    }
    
    return NULL;
}


void paging_map(page_directorie_t * pd, u32 virtual, u32 physical, bool write, bool user)
{
    if (!IS_PAGE_ALIGN(physical) || !IS_PAGE_ALIGN(virtual))
    {
        panic("Cannot page map %x to %x, because it's not page aligned!", virtual, physical);
    }

    u32 pdindex = (u32)virtual >> 22;
    u32 ptindex = (u32)virtual >> 12 & 0x03FF;
    // debug("Mapping %x(%d; %d) to %x.", virtual, pdindex, ptindex, physical);

    page_directorie_entry_t * pd_entry = &pd->entries[pdindex];
    page_table_t * pt = (page_table_t *)(pd_entry->PageFrameNumber * PAGE_SIZE);
    
    if (!pd_entry->Present)
    {
        pt = paging_new_page_table();
        
        if (pt == NULL)
        {
            panic("Cannot allocate a new page table!");
        }

        pd_entry->Present = true;
        pd_entry->Write = write;
        pd_entry->User = user;
        pd_entry->PageFrameNumber = (u32)(pt) >> 12;
    }

    page_t* page = &pt->pages[ptindex];
    page->Present = true;
    page->User = user;
    page->Write = write;
    page->PageFrameNumber = physical>>12;

    paging_invalidate_tlb();
}


void paging_unmap(page_directorie_t * pd, u32 virtual)
{
    u32 pdindex = (u32)virtual >> 22;
    u32 ptindex = (u32)virtual >> 12 & 0x03FF;

    page_directorie_entry_t * pd_entry = &pd->entries[pdindex];
    page_table_t * pt = (page_table_t *)(pd_entry->PageFrameNumber * PAGE_SIZE);
    page_t* page = &pt->pages[ptindex];

    page->as_uint = 0;
}

