#pragma once
#include "types.h"

struct	boundary_tag
{
	unsigned int magic;			//< It's a kind of ...
	unsigned int size; 			//< Requested size.
	unsigned int real_size;		//< Actual size.
	int index;					//< Location in the page table.

	struct boundary_tag *split_left;	//< Linked-list info for broken pages.	
	struct boundary_tag *split_right;	//< The same.
	
	struct boundary_tag *next;	//< Linked list info.
	struct boundary_tag *prev;	//< Linked list info.
};

void mm_setup();
void * mm_kernel_acquire(size_t page_count);
int    mm_kernel_giveup(size_t page_count);

void * mem_frame_set_used(void * mem);
void   mem_frame_set_free(void * mem);
void * mem_frame_alloc();
void   mem_frame_free(void * mem);
