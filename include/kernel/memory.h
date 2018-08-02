#pragma once
#include "types.h"

void mm_setup();

void   mem_frame_set_used(void * mem);
void   mem_frame_set_free(void * mem);
void * mem_frame_alloc();
void   mem_frame_free(void * mem);