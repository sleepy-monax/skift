#pragma once
#include "types.h"

#define cli() asm volatile("cli");
#define sti() asm volatile("sti");
#define hlt() asm volatile("hlt");

void cpu_setup();