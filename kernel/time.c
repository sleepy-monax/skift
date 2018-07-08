#include "kernel/time.h"
#include "kernel/x86.h"

bool is_cmos_update()
{
    outb(CMOS_ADDRESS, 0x0A);
    return (inb(CMOS_DATA) & 0x80);
}

u8 get_realtime_reg(s32 reg)
{
    outb(CMOS_ADDRESS, reg);
    return inb(CMOS_DATA);
}

u32 time_get(u32 selector)
{
    while (is_cmos_update());
    return from_bcd(get_realtime_reg(selector));
}

time_t time(void)
{
    // Waite for cmos update.
    while (is_cmos_update());
    time_t time;

    time.second = from_bcd(get_realtime_reg(0x00));
    time.minute = from_bcd(get_realtime_reg(0x02));
    time.hour = from_bcd(get_realtime_reg(0x04));
    time.day = from_bcd(get_realtime_reg(0x07));
    time.month = from_bcd(get_realtime_reg(0x08));
    time.year = from_bcd(get_realtime_reg(0x09));

    return time;
}