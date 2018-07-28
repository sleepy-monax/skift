#include "kernel/atomic.h"
#include "kernel/system.h"
#include "stdlib.h"
#include "string.h"
#include "libc.h"

#define BLOCK_MAGIC 0xB0C0C0CA

typedef struct 
{
    bool used;
    u32 magic;
    u32 size;

    void * next;
    void * prev;
} block_t;

extern u32 __end;
u32 heap_top = 0;
u32 heap_base = 0;

block_t * tail;
block_t * head;

bool heap_setup()
{
    heap_base = heap_top = (u32)&__end;
    
    tail = (block_t*)heap_base;
    head = tail;

    tail->size = 0;
    tail->magic = BLOCK_MAGIC;
    tail->used = false;
    
    tail->next = NULL;
    tail->prev = NULL;

    heap_top += sizeof(block_t);
    
    return true;
}

void * calloc(size_t nelem, size_t elsize)
{
	void *p;

	p = malloc (nelem * elsize);
	if (p == 0)
		return (p);

    memset(p, 0, nelem * elsize);
	return (p);
}

void * malloc(size_t size)
{
    atomic_begin();

    if (heap_top == 0)
        heap_setup();

    block_t * block;

    if (!tail->used)
    {
        block = tail;
        heap_top += size - tail->size;
        debug("Sizing the tail at %x from %d to %d.", tail, tail->size, size);
    }
    else
    {
        block = (block_t*)heap_top;        
        block->prev = tail;
        tail->next  = block;
        
        debug("Block %x allocated (s: %d).", block, block->size);

        tail = block;
        heap_top += sizeof(block_t) + size;
    }
       
    block->used = true;
    block->magic = BLOCK_MAGIC;
    block->size = size;

    atomic_end();

    return block + 1;
}


void free(void * address)
{
    atomic_begin();
    block_t * block = (block_t *)address - 1;

    if (block->magic != BLOCK_MAGIC)
    {
        panic("HEAP CORUPTED: block magic is 0x%x not 0x%x!", block->magic, BLOCK_MAGIC);
    }

    block->used = false;
    debug("Memory at %x is now free.", address);
    atomic_end();
}

void dump_heap()
{
    block_t * current_block = (block_t *)heap_base;
    print("&fHeap dump:&7");
    do
    {
        printf("\n\tblock: %x s: %d used: %d next: %x", current_block, current_block->size, current_block->used, current_block->next);
        current_block = current_block->next;
    } while (current_block != NULL);
    print("\n");
}