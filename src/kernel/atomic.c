#include "kernel/atomic.h"
#include "cpu/cpu.h"

bool is_atomic_enable = false;

void atomic_enable()
{
    is_atomic_enable = true;
}

void atomic_begin()
{
    if (is_atomic_enable)
        cli();
}

void atomic_end()
{
    if (is_atomic_enable)
        sti();
}