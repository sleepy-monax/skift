#include "libc.h"
#include "kernel/system.h"

#define BLOCK_MAGIC 0xB0C0C0CA

typedef struct 
{
    u32 magic;
    u32 size;
    bool free;
    void * next;
} block_t;

extern u32 __end;
u32 heap_base;
u32 heap_end;

block_t * create_block(u32 address);
block_t * find_free_block(u32 size);
void merge_right(block_t * block);
block_t * get_last_block();

void heap_setup()
{
    heap_base = heap_end = (u32)&__end;
    info("Heap base at %x(%d).", heap_base, heap_base);
    create_block(heap_base);
}

/* malloc ********************************************************************/

void * malloc(u32 size)
{
    block_t * block = find_free_block(size);

    if (block == NULL)
    {
        // Create a new block.
        block_t * last_block = get_last_block();
        block = create_block(heap_end);
        last_block->next = (void *)block;
        block->next = NULL;

        heap_end += size + sizeof(block_t);
    }

    block->free = false;
    block->size = size;
    return (void *)(block + 1);
}

void * calloc(u32 nelem, u32 elsize)
{
	void *p;

	p = malloc (nelem * elsize);
	if (p == 0)
		return (p);

    memset(p, 0, nelem * elsize);
	return (p);
}

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

/* free **********************************************************************/

void clear_block(void * address)
{
    block_t * block = (block_t *)address - 1;
    memset(address, 0, block->size);
}

void free(void * address)
{
    block_t * block = (block_t *)address - 1;

    if (block->magic != BLOCK_MAGIC)
    {
        error("\nBlock magic is 0x%x not 0x%x!", block->magic, BLOCK_MAGIC);
    }

    block->free = true;
}