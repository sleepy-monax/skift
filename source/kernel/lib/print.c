#include "kernel/system.h"
#include "kernel/task.h"
#include "libc.h"

void print(string message)
{
    console_print(message);
}

void printfva(string format, va_list va)
{
    char buffer[1024];
    printfbva(buffer, format, va);
    console_print(buffer);
}

void printf(string format, ...)
{
    va_list va;
    va_start(va, format);

    printfva(format, va);
}