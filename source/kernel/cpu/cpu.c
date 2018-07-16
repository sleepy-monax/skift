#include "cpu/cpu.h"
#include "cpu/fpu.h"
#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "kernel/system.h"


u8 inb(u16 port)
{
    u8 data;
    asm volatile("in %1,%0" : "=a" (data) : "d" (port));
    return data;
}

void outb(u16 port, u8 data)
{
    asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

u16 inw(u16 port)
{
    u16 data;
    asm volatile("inw %1,%0" : "=a" (data) : "d" (port));
    return data;
}

void outw(u16 port, u16 data)
{
    asm volatile("outw %0,%1" : : "a" (data), "d" (port));
}

void cpu_setup()
{
    setup(gdt);
    setup(pic);
    setup(idt);
    setup(fpu);
}
