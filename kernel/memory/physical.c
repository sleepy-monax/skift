#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/paging.h"

#include "sync/atomic.h"

u8 mem_frame[1024  * 1024 / 8];

inline bool mem_frame_is_used(void * mem)
{
    return mem_frame[(u32)mem / PAGE_SIZE / 8] & 1 << (u32)mem / PAGE_SIZE % 8;
}

void * mem_frame_get_free()
{
    for(size_t i = 0; i < 1024 * 1024; i++)
    {
        void * p = (void *)(i * PAGE_SIZE);

        if (!mem_frame_is_used(p))
        {
            return p;
        }
    }

    return NULL;
}

void * mem_frame_set_used(void * mem)
{
    // debug("Memory frame set used: %x.", (u32)mem);
    mem_frame[(u32)mem / PAGE_SIZE / 8] |= 1 << (u32)mem / PAGE_SIZE % 8;
    return mem;
}

void mem_frame_set_free(void * mem)
{
    // debug("Memory frame set free: %x.", (u32)mem);
    mem_frame[(u32)mem / PAGE_SIZE / 8] &= ~(1 << (u32)mem / PAGE_SIZE % 8);
}

void * mem_frame_alloc()
{
    atomic_begin();

    void * mem = mem_frame_get_free();
    mem_frame_set_used(mem);
    
    atomic_end();

    return mem;
}

void mem_frame_free(void * mem)
{
    atomic_begin();
    if (mem_frame_is_used(mem))
    {
        mem_frame_set_free(mem);
    }
    else
    {
        panic("Trying to free a free frame: %x.", (u32)mem);
    }
    atomic_end();
}