#include "device/vga.h"
#include "kernel/x86.h"

u16 *video_memory = (u16 *)vga_frame_buffer;

bool install_vga(void)
{
    vga_clear(vga_color(vga_Black, vga_White));
    vga_set_cursor(0, 0);
    return true;
}

void vga_clear(u8 clear_color)
{
    for (u32 y = 0; y < vga_screen_height; y++)
    {
        for (u32 x = 0; x < vga_screen_width; x++)
        {
            vga_set_cell(x, y, ' ', clear_color);
        }
    }   
}

void vga_scroll(void)
{
    for (u32 x = 0; x < vga_screen_width; x++)
    {
        for (u32 y = 0; y < vga_screen_height + 1; y++)
        {
            video_memory[x + y * vga_screen_width] = video_memory[x + (y + 1) * vga_screen_width];
        }
    }
}

void vga_set_cells(u32 x, u32 y, string str, u8 color)
{
    u32 i = 0;
    while (str[i]){
      vga_set_cell(x + i, y, str[i], color);
      i++;
    }
}

void vga_set_cell(u32 x, u32 y, char c, u8 color)
{
    u16 cell = color << 8 | c;
    video_memory[x + y * vga_screen_width] = cell;
}

void vga_set_cursor(u32 x, u32 y)
{
    u16 cursorLocation = y * 80 + x;
    outb(0x3D4, 14);                  // Tell the VGA board we are setting the high cursor byte.
    outb(0x3D5, cursorLocation >> 8); // Send the high cursor byte.
    outb(0x3D4, 15);                  // Tell the VGA board we are setting the low cursor byte.
    outb(0x3D5, cursorLocation);      // Send the low cursor byte.
}
