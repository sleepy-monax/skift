#include "libc.h"
#include "string.h"

void printfb(char * buffer, string format, ...)
{
    va_list va;
    va_start(va, format);

    printfbva(buffer, format, va);
}

char * printfbva(char * buffer, const char * format, va_list va)
{
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

    return buffer;
}