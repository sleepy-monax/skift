#include "kernel/atomic.h"
#include "kernel/system.h"
#include "stdlib.h"
#include "string.h"

#define BLOCK_MAGIC 0xB0C0C0CA

typedef struct 
{
    u32 magic;
    u32 owner;
    u32 size;
    bool free;
    void * next;
    void * prev;
} block_t;

extern u32 __end;
u32 heap_base = 0;
u32 heap_end;

block_t * tail;

/* malloc ********************************************************************/

void merge_right(block_t * block)
{
    block_t * next = block->next;
    block->next = next->next;
    block->size += next->size + sizeof(block_t);
}

block_t * find_free_block(u32 size)
{
    block_t * current_block = (block_t *)heap_base;
    while (current_block->next != NULL)
    {
        if (current_block->free)
        {
            if (current_block->size >= size)
            {
                return current_block;
            }
            else
            {
                block_t * next_block = current_block->next;
                if (next_block->free)
                {
                    merge_right(current_block);
                }
                else
                {
                    current_block = current_block->next;
                }
            }
        }
        else
        {
            current_block = current_block->next;
        }
    }

    return NULL;
}

block_t * create_block(u32 address)
{
    block_t * b = (block_t *)address;
    b->magic = BLOCK_MAGIC;
    b->free = true;
    b->next = NULL;
    b->prev = NULL;
    b->size = 0;

    return b;
}

block_t * get_last_block()
{
    block_t * block = (block_t *)heap_base;

    while (block->next != NULL)
    {
        block = (block_t *)block->next;
    }

    return block;
}

block_t * append_block(size_t size)
{
        block_t * block = create_block(heap_end);
        if (tail !=  NULL) tail->next = (void *)block;
        block->next = NULL;

        tail = block;
        heap_end += sizeof(block_t) + size;

        return block;
}

/* --- Public functions ----------------------------------------------------- */

bool install_heap()
{
    heap_base = heap_end = (u32)&__end;
    debug("Heap base at %x.", heap_base, heap_base);
    create_block(heap_base);

    return true;
}

void * malloc(size_t size)
{
    atomic_begin();

    if (heap_base == 0)
    {
        install_heap();
    }

    block_t * block = find_free_block(size);

    if (block == NULL)
    {
        block = append_block(size);
    }

    block->free = false;
    block->size = size;
    
    debug("%dbytes allocated at %x(block %x)", block->size, (void *)(block + 1), block);

    atomic_end();
    return (void *)(block + 1);
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

void free(void * address)
{
    atomic_begin();
    block_t * block = (block_t *)address - 1;

    if (block->magic != BLOCK_MAGIC)
    {
        panic("HEAP CORUPTED: block magic is 0x%x not 0x%x!", block->magic, BLOCK_MAGIC);
    }

    block->free = true;
    atomic_end();
}