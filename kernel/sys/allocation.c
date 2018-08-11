/* Copyright (c) 2018 Nicolas Van Bossuyt.                                    */
/* This code is licensed under the MIT License.                               */
/* See: LICENSE.md                                                            */

#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "utils.h"
#include "types.h"

#include "kernel/memory.h"
#include "kernel/paging.h"

typedef PACKED(struct) page_block
{
    uint page_count;
    uint free_memory;
    void *first_block;
    uint block_count;
    struct page_block *prev;
    struct page_block *next;
}
page_block_t;

typedef PACKED(struct) block
{
    u32 size;
    bool used;
    struct block *next;
    struct page_block *page;
}
block_t;

page_block_t *first_block;

page_block_t *alloc_new_page_block(page_block_t * prev, uint page_count)
{
    page_block_t *pblock = (page_block_t *)memory_alloc(page_count);

    pblock->page_count = page_count;
    pblock->free_memory = PAGE_SIZE * page_count - sizeof(page_block_t);
    pblock->block_count = 0;
    pblock->first_block = NULL;
    pblock->next = NULL;

    return pblock;
}

block_t *alloc_in_page_block(page_block_t* page_block, size_t size)
{
    if (page_block->free_memory >= size + sizeof(block_t))
    {
        for(block_t* b = (block_t*)(page_block + 1); b != NULL; b = b->next)
        {
            if (b->size >= size)
            {

            }
        }   
    }

    return NULL;
}

void free_page_block(page_block_t *pblock)
{
    memory_free((void *)pblock, pblock->page_count);
}

/* --- public functions ----------------------------------------------------- */

void *malloc(size_t size)
{
    // find a free block
    for(page_block_t* p = first_block; p != NULL; p = p->next)
    {
        if (p->free_memory >= size + sizeof(block_t))
        {
            for(block_t* b = p->first_block; b != NULL; b = b->next)
            {
                if (!b->used && b->size >= size)
                {
                    b->used = true;
                    return (void*)(b + 1)
                } 
            }   
        }
    }

    page_block_t * p = alloc_new_page_block( min( size / PAGE_SIZE, 1 ) );
}

void *amalloc(size_t size, uint align)
{
    return internal_malloc(size, true, align);
}

void *realloc(void *p, size_t size)
{
    UNUSED(p);
    UNUSED(size);
    return NULL;
}

void *calloc(size_t count, size_t size)
{
    void *p = malloc(count * size);
    memset(p, 0, count * size);
    return p;
}

void free(void *p)
{
    
}