#include <unistd.h>
#include "kernel/memory.h"

int brk(void *addr)
{
    return kbrk(addr);
}

void *sbrk(int increment)
{
    return ksbrk(increment);
}