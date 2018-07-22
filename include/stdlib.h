#pragma once
#include "types.h"

void * malloc(u32 size);
void * calloc(u32 nelem, u32 elsize);
void free(void * address);