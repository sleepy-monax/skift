#include "ascii.h"
#include "device/uart.h"
#include "kernel/x86.h"

bool color_enabled = true;

bool install_uart()
{
    uart_open_port(COM1);
    uart_open_port(COM2);
    uart_open_port(COM3);
    uart_open_port(COM4);

    return true;
}

void uart_open_port(u16 port)
{
   outb(port + 1, 0x00);    // Disable all interrupts
   outb(port + 3, 0x80);    // Enable DLAB (set baud rate divisor)
   outb(port + 0, 0x03);    // Set divisor to 3 (lo byte) 38400 baud
   outb(port + 1, 0x00);    //                  (hi byte)
   outb(port + 3, 0x03);    // 8 bits, no parity, one stop bit
   outb(port + 2, 0xC7);    // Enable FIFO, clear them, with 14-byte threshold
   outb(port + 4, 0x0B);    // IRQs enabled, RTS/DSR set
}

int uart_is_transmit_empty(uart_port_t port)
{
   return inb(port + 5) & 0x20;
}
 
void uart_put(uart_port_t port, char a) 
{
   while (uart_is_transmit_empty(port) == 0);
 
   outb(port,a);
}

void uart_print(uart_port_t port, string str) 
{   
    bool wait_for_color = false;
    for(u32 i = 0; str[i] != '\0'; i++)
    {
        char c = str[i];

        // Strip color control for the console.
        if (c == ASCII_AND && !wait_for_color)
        {
            wait_for_color = true;
        }
        else if (wait_for_color)
        {
            wait_for_color = false;
        }
        else
        {
            uart_put(port, c);
        }

    }
}