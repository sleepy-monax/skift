#include "kernel/syscall.h"
#include "kernel/x86.h"
#include "kernel/kernel.h"
#include "kernel/logging.h"

bool install_syscall()
{
    add_interrupts_handler(0x30, &syscall_interrupt);

    return true;
}

void syscall_interrupt(registry_t* reg)
{
    INFO("syscall %d", reg->eax);
    __dump_register(reg);
}