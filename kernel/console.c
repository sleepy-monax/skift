#include "ascii.h"
#include "convert.h"
#include "device/vga.h"
#include "kernel/console.h"
#include "kernel/kernel.h"

console_t console;

bool install_console()
{
    install_vga();

    console.cursor_x = 0;
    console.cursor_y = 0;
    console.color_bg = vga_Black;
    console.color_fg = vga_Light_Gray;

    /*kprintf("color test: ");
    for(s8 i = 0; i < 0xf + 1; i++)
    {
        kprintf("&%xc", i);
    }
    kprintf("\n");*/

    return true;
}

void console_print(string message)
{
    bool wait_for_color_id = false;

    for(u32 i = 0; message[i]; i++)
    {
        char c = message[i];

        if (wait_for_color_id == true)
        {
            if (c == ASCII_AND)
            {
                vga_set_cell(console.cursor_x, console.cursor_y, c, vga_color(console.color_bg, console.color_fg));
                console.cursor_x++;
            }
            else
            {
                char buffer[2] = " ";
                buffer[0] = c;
                console.color_fg = string_to_uint(buffer, 16);
            }

            wait_for_color_id = false;
        }
        else
        {
            switch (c)
            {
                case ASCII_LF:
                    console.cursor_y++;
                    console.cursor_x = 0;
                    break;
                
                case ASCII_AND:
                    wait_for_color_id = true;
                    break;

                case ASCII_HT:
                    console.cursor_x = console.cursor_x + TAB_SIZE - (console.cursor_x % TAB_SIZE);
                    break;
                
                case ASCII_CR:
                    console.cursor_x = 0;
                    break;
                
                default:
                    vga_set_cell(console.cursor_x, console.cursor_y, c, vga_color(console.color_bg, console.color_fg));
                    console.cursor_x++;
                    break;
            }
        }

        if (console.cursor_x >= vga_screen_width)
        {
            console.cursor_x = 0;
            console.cursor_y++;
        }

        if (console.cursor_y >= vga_screen_height)
        {
            console.cursor_x = 0;
            console.cursor_y--;
            vga_scroll();
        }
    }

    vga_set_cursor(console.cursor_x, console.cursor_y);
}

u32 console_read(string buffer, u32 size)
{
    UNUSED(buffer);
    UNUSED(size);
    return 0;
}