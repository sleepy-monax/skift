#ifdef __KERNEL

#include <unistd.h>
#include "kernel/memory.h"

void *brk(void *addr)
{
    return kbrk(addr);
}

void *sbrk(int increment)
{
    return ksbrk(increment);
}

#endif