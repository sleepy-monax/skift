#pragma once
#include "types.h"

void exit(int status);

void * malloc (size_t size);
void * realloc(void * p, size_t size);
void * calloc (size_t , size_t);
void   free   (void *);

/* !!! NOT STANDART --------------------------------------------------------- */

// string to uint
u32 stoi(string str, u8 base);

// uint to string
void itos(u32 value, string buffer, u8 base);