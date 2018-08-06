#include "utils.h"
#include "types.h"
#include <stdlib.h>

typedef PACKED(struct)
{
    u32 size;
    bool used;
    void * next;
} block_t;

void * malloc (size_t size)
{
    UNUSED(size);
    return NULL;
}

void * realloc(void * p, size_t size)
{
    UNUSED(p);
    UNUSED(size);
    return NULL;
}

void * calloc (size_t count , size_t size)
{
    UNUSED(count);
    UNUSED(size);
    return NULL;
}

void   free   (void *p)
{
    UNUSED(p);
}