#pragma once
#include "types.h"
#include "kernel/x86.h"

extern u32 clock_tick;
bool install_clock();
void clock_interrupt(registry_t* reg);