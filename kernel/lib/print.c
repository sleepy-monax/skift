#include "libc.h"
#include "kernel/system.h"

void print(string message)
{
    cli();
    console_print(message);
    sti();
}

void printfva(string format, va_list va)
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
                    itos(va_arg(va, u32), temp, 2);
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

                        itos(uvalue, temp, 10);
                        strcat(buffer, temp);
                    }
                    break;

                case 'u':
                    itos(va_arg(va, u32), temp, 10);
                    strcat(buffer, temp);
                    break;

                case 'x':
                    itos(va_arg(va, u32), temp, 16);
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
}

void printf(string format, ...)
{
    cli();
    va_list va;
    va_start(va, format);

    printfva(format, va);
    sti();
}