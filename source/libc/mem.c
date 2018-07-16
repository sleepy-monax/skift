#include "libc.h"

void memcpy(void * dest, void * src, u32 len)
{
    u32 i;
    for (i = 0; i < len; i++) {
        *((u8*)dest + i) = *((u8*)src + i);
    }
}

void memset(void * dest, int val, u32 len)
{
    u8* temp = (u8*)dest;
    for ( ; len != 0; len--) *temp++ = val;
}