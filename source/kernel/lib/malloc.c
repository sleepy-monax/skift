#include "stdlib.h"
#include "kernel/system.h"
#include "string.h"

#define MAGIC 0xDEADBEFF

typedef struct block
{
    u32 magic;
    bool used;
    u32 size;
    struct block * next;
    struct block * prev;
} block_t;

void try_merge_left(block_t * block)
{

}

void try_merge_right(block_t * block)
{

}

block_t * getblockof(void * p)
{
    block_t * block = p - sizeof(block_t);

    if (block->magic == MAGIC)
    {
        return block;
    }

    return NULL;
}

block_t * base;
block_t * end;
void * heap_top;
void * heap_base;

void * malloc(size_t size)
{

}

void * realloc(void * p, size_t new_size)
{

}

void * calloc (size_t number, size_t size)
{
    return malloc(number * size);
}

void free(void * p)
{
    block_t * block = p - sizeof(block_t);
    if (block->magic == MAGIC && block->used == true)
    {
        block->used = false;
    }
    else
    {
        panic("Trying to free invalid block at 0x%x!", (u32)p);
    }
}