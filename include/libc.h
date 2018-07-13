#pragma once
#include "types.h"
#include "valist.h"

void print(string message);
void printf(string format, ...);
void printfva(string format, va_list va);

void memcpy(u8 *dest, u8 *src, u32 len);
void memset(void * dest, int val, u32 len);
void * malloc(u32 size);
void * calloc(u32 nelem, u32 elsize);
void free(void * address);

void   strapd(string str,  char c);
void   strbs (string str);
s32    strcmp(string stra, string strb);
string strdup(string str);
u32    strlen(string str);
void   strrvs(string str);
string strcat(string dest, string src);

u32 stoi(string str, u8 base);
void itos(u32 value, string buffer, u8 base);

void heap_setup();