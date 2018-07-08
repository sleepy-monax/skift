#include "convert.h"
#include "valist.h"
#include "string.h"
#include "device/uart.h"
#include "kernel/console.h"

void kprint(string message)
{
    console_print(message);
    uart_print(COM1, message);
}

void kprintfva(string format, va_list va)
{
    char buffer[1024];
    buffer[0] = '\0';

    bool wait_for_format = false;

    for (u32 i = 0; format[i]; i++)
    {
        char c = format[i];

        if (c == '%' && !wait_for_format)
        {
            wait_for_format = true;
        }
        else if (wait_for_format)
        {
            char temp[32];
            switch (c)
            {
                case 'b':
                    uint_to_string(va_arg(va, u32), temp, 2);
                    strcat(buffer, "0b");
                    strcat(buffer, temp);
                    break;

                case 'd':
                    {
                        bool isneg = false;
                        int value = va_arg(va, u32);
                        uint uvalue = 0;
                        
                        if (value < 0)
                        {
                            isneg = true;
                            uvalue = 0 - value;
                        }
                        else
                        {
                            uvalue = value;
                        }

                        if (isneg)
                        {
                            strcat(buffer, "-");
                        }

                        uint_to_string(uvalue, temp, 10);
                        strcat(buffer, temp);
                    }
                    break;

                case 'u':
                    uint_to_string(va_arg(va, u32), temp, 10);
                    strcat(buffer, temp);
                    break;

                case 'x':
                    uint_to_string(va_arg(va, u32), temp, 16);
                    strcat(buffer, "0x");
                    strcat(buffer, temp);
                    break;

                case 'c':
                    strapd(buffer, va_arg(va, char));
                    break;

                case 's':
                    strcat(buffer, va_arg(va, string));
                    break;
            
                default:
                    break;
            }

            wait_for_format = false;
        }
        else
        {
            strapd(buffer, c);
        }
    }
    
    console_print(buffer);
    uart_print(COM1, buffer);
}

void kprintf(string format, ...)
{
    va_list va;
    va_start(va, format);

    kprintfva(format, va);
}