#pragma once
#include "types.h"

#define TAB_SIZE 8

typedef struct 
{
    u32 cursor_x;
    u32 cursor_y;
    u8  color_fg;
    u8  color_bg; 
} console_t;

bool install_console(void);
void console_print(string message);
u32 console_read(string buffer, u32 size);