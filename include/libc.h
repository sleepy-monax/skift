#pragma once

#include "types.h"
#include "stdarg.h"

#define EXIT_SUCCESS  0
#define EXIT_FAILURE -1

#define stdin 0
#define stdout 1 
#define stderr 2

void exit(int errcode);

void print(string message);
void printf(string format, ...);
void printfb(char * buffer, string format, ...);
void fprintf(int file, string format, ...);
void printfva(string format, va_list va);
char * printfbva(char * buffer, const char * format, va_list va);

void * malloc(u32 size);
void * calloc(u32 nelem, u32 elsize);
void free(void * address);

u32 stoi(string str, u8 base);
void itos(u32 value, string buffer, u8 base);

void heap_setup();

#define NEW(x) (x *)malloc(sizeof(x))