#pragma once
#include "types.h"

typedef PACKED(struct) memory_block
{
    struct memory_block * next;
    u32 size;
} memory_block_t;

void mm_setup();
