/* Copyright (c) 2018 Nicolas Van Bossuyt.                                    */
/* This code is licensed under the MIT License.                               */
/* See: LICENSE.md                                                            */

#include <stdlib.h>
#include <string.h>

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
page_block_t *last_block;

void allocator_init()
{
}

page_block_t *alloc_new_page_block(uint page_count)
{
    page_block_t *pblock = (page_block_t *)memory_alloc(page_count);

    pblock->page_count = page_count;
    pblock->free_memory = PAGE_SIZE * page_count - sizeof(page_block_t);
    pblock->block_count = 0;
    pblock->first_block = NULL;
    pblock->next = NULL;

    return pblock;
}

void free_page_block(page_block_t *pblock)
{
    memory_free((void *)pblock, pblock->page_count);
}

void *internal_malloc(size_t size, bool aligned, uint align)
{
    UNUSED(size);
    UNUSED(aligned);
    UNUSED(align);

    return NULL;
}

void internal_free(void *p)
{
    UNUSED(p);
}

/* --- public functions ----------------------------------------------------- */

void *malloc(size_t size)
{
    return internal_malloc(size, true, 0);
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
    void *p = internal_malloc(count * size, false, 0);
    memset(p, 0, count * size);
    return p;
}

void *acalloc(size_t count, size_t size, uint align)
{
    void *p = internal_malloc(count * size, true, align);
    memset(p, 0, count * size);
    return p;
}

void free(void *p)
{
    internal_free(p);
}