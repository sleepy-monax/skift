#pragma once
#include "types.h"
#include "utils.h"
#include "kernel/paging.h"

void memory_init();

page_directorie_t * memory_construct_memory_space();
void memory_detroy_memory_space(page_directorie_t * page_dir);

uint ksbrk(int increment);
void* kbrk(void *addr);

uint usbrk(page_directorie_t* dir, int increment);
void* ubrk(page_directorie_t* dir, void *addr);