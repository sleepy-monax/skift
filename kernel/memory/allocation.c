#include <string.h>

#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/paging.h"

void * ksbrk(size_t size)
{
    UNUSED(size);
    return NULL;
}

void * kmalloc(size_t size)
{
    UNUSED(size);
    return NULL;
}

void kfree(void * p)
{
    UNUSED(p);
}