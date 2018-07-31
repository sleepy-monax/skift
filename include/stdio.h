#pragma once
#include "types.h"
#include "stdarg.h"

void print(string message);
void printf(string format, ...);
void printfb(char * buffer, string format, ...);
void fprintf(int file, string format, ...);
void printfva(string format, va_list va);
char * printfbva(char * buffer, const char * format, va_list va);