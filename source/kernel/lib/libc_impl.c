#include "libc.h"
#include "kernel/system.h"

void __exit(int errcode)
{
    panic("Kernel exit errcode: %d.", errcode);
}