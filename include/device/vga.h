#pragma once

#include "types.h"

#define vga_screen_width 80
#define vga_screen_height 25

#define vga_Black         0x0
#define vga_Blue          0x1
#define vga_Green         0x2
#define vga_Cyan          0x3
#define vga_Red           0x4
#define vga_Magenta       0x5
#define vga_Brown         0x6
#define vga_Light_Gray    0x7
#define vga_Gray          0x8
#define vga_Light_Blue    0x9
#define vga_Light_Green   0xA
#define vga_Light_Cyan    0xB
#define vga_Light_Red     0xC
#define vga_Light_Magenta 0xD
#define vga_Light_Yellow  0xE
#define vga_White         0xF

#define vga_bgcolor(bg) (bg << 4)
#define vga_fgcolor(fg) (fg)
#define vga_color(bg, fg) (bg << 4 | fg)
#define vga_default vga_bgcolor(vga_Black, vga_Light_Gray)

#define vga_frame_buffer 0xB8000

extern u32 vga_cursor_x;
extern u32 vga_cursor_y;

bool install_vga(void);

void vga_clear(u8 clear_color);
void vga_scroll(void);

void vga_set_cell (u32 x, u32 y, char c,     u8 color);
void vga_set_cells(u32 x, u32 y, string str, u8 color);
void vga_set_cursor(u32 x, u32 y);