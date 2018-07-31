#pragma once
#include "types.h"

typedef struct
{
    u32 width;
    u32 height;
    buffer32_t buffer;
} bitmap_t;

u32 rgb(u8 r, u8 g, u8 b);
u32 hsv2rgb(float h, float s, float v);