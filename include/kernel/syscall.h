#pragma once
#include "types.h"
#include "kernel/x86.h"

bool install_syscall();
void syscall_interrupt(registry_t* reg);