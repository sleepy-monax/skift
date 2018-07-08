#include "string.h"
#include "types.h"

u32 strlen(string str)
{
    u32 lenght = 0;
    while (str[lenght]) lenght++;
    return lenght;
}

s32 strcmp(string stra, string strb)
{
    u32 i;

    for (i = 0; stra[i] == strb[i]; i++) {
        if (stra[i] == '\0') return 0;
    }

    return stra[i] - strb[i];
}

void strapd(string str, char c) 
{
    u32 len = strlen(str);
    str[len] = c;
    str[len+1] = '\0';
}

void strbs(string str) 
{
    u32 len = strlen(str);
    str[len - 1] = '\0';
}

void strrvs(string str) 
{
    int c, i, j;
    for (i = 0, j = strlen(str) - 1; i < j; i++, j--) 
    {
        c = str[i];
        str[i] = str[j];
        str[j] = c;
    }
}

string strcat(string dest, string src)
{
    u32 i,j;
    for (i = 0; dest[i] != '\0'; i++);

    for (j = 0; src[j] != '\0'; j++)
        dest[i+j] = src[j];
    dest[i+j] = '\0';
    return dest;
}