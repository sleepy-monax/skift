#include "kernel/syscall.h"
#include "kernel/x86.h"
#include "kernel/kernel.h"

bool install_syscall()
{
    add_interrupts_handler(30, &syscall_interrupt);

    return true;
}

void syscall_interrupt(registry_t* reg)
{
    UNUSED(reg);
    kprintf("syscall %d\n", reg->eax);
}