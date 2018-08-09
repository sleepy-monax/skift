/* Copyright (c) 2018 Nicolas Van Bossuyt.                                    */
/* This code is licensed under the MIT License.                               */
/* See: LICENSE.md                                                            */

// skiftOS memory allocator for userspace and kernel.

#include "utils.h"
#include "types.h"

#include <stdlib.h>
#include <unistd.h>
#include <string.h>

typedef PACKED(struct) block
{
    u32 size;
    bool used;
    struct block *next;
    struct block *prev;
}
block_t;

void * heap_base = NULL;
void * heap_top = NULL;

void * internal_malloc(size_t size, bool aligned, uint align)
{
    UNUSED(size);
    UNUSED(aligned);
    UNUSED(align);

    if (heap_base == NULL)
    {
        heap_base = sbrk(0);
    }

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