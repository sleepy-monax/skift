#include "device/clock.h"
#include "kernel/kernel.h"
#include "kernel/x86.h"

u32 clock_tick = 0;
u32 frequency = 1000;
bool install_clock()
{
    add_interrupts_handler(32, &clock_interrupt);

    u32 divisor = 1193180 / frequency;
    outb(0x43, 0x36);
    u8 l = (u8)(divisor & 0xFF);
    u8 h = (u8)( (divisor>>8) & 0xFF );
    outb(0x40, l);
    outb(0x40, h);

    return true;
}

void clock_interrupt(registry_t* reg)
{
    UNUSED(reg);
    clock_tick++;



    if (clock_tick % 1000 == 0)
    {
        kprintf("&4tack\t&f");
    }
    else if (clock_tick % 500 == 0)
    {
        kprintf("&2tick\t&f");
    }
}
