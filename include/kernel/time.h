#pragma once

#include "types.h"

/* --- CMOS ----------------------------------------------------------------- */

#define from_bcd(val)  ((val / 16) * 10 + (val & 0xf))

#define CMOS_ADDRESS 0x70
#define CMOS_DATA 0x71

bool is_cmos_update();
u8   get_realtime_reg(s32 reg);

/* --- Time ----------------------------------------------------------------- */

#define TIME_SECOND 0x00
#define TIME_MINUTE 0x02
#define TIME_HOUR   0x04
#define TIME_DAY    0x07
#define TIME_MONTH  0x08
#define TIME_YEAR   0x09

typedef struct {
    u8 second;
    u8 minute;
    u8 hour;
    u8 day;
    u8 month;
    u32 year;
} time_t;

time_t time(void);
u32 time_get(u32 selector);