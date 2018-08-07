#pragma once
#include "types.h"
#include <stdarg.h>

#define EOF -1

typedef struct
{
    int fd;
} FILE;

// Standart-ish
int sprintf(char *str, const char *format, ...);
int printf(const char *format, ...);
int vprintf(const char *format, va_list va);
int vsprintf(char *str, const char *format, va_list va);

int putchar(int chr);
int getchar();

char * gets(char * str);
int puts(const char * str);
