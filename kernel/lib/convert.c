#include "libc.h"

string basechar     = "0123456789abcdefghijklmnopqrstuvwxyz";
string basechar_maj = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

// string to s

u32 stoi(string str, u8 base)
{
    u32 i = 0;
    u32 value = 0;

    while (str[i])
    {
        value = value * base;

        for (u8 j = 0; j < base; j++)
        {
            if ((basechar[j] == str[i]) | (basechar_maj[j] == str[i]))
            {
                value += j;
            }
        }

        i++;
    }

    return value;
}

// int to string
void itos(u32 value, string buffer, u8 base)
{
    buffer[0] = '\0';   
    if (value == 0){ strapd(buffer, '0'); return; }
    
    u32 v = value;

    while (v != 0)
    {
        strapd(buffer, basechar_maj[v % base]);
        v /= base;
    }

    strrvs(buffer);
}