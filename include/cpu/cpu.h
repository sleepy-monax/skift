#pragma once
#include "types.h"

#define cli() asm volatile("cli")
#define sti() asm volatile("sti")
#define hlt() asm volatile("hlt")

typedef PACKED(struct)
{
    u32 gs, fs, es, ds;
    u32 edi, esi, ebp, USELESS, ebx, edx, ecx, eax;
    u32 int_no, errcode;
    u32 eip, cs, eflags;
} context_t;

u32 CR0();
void cpu_setup();