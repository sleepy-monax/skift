#pragma once
#include "types.h"

typedef struct list 
{
    u32 count;
    struct list_node * head;
} list_t;

struct list_node 
{
    u32 val;
    struct list_node * next;
};

list_t* list_alloc(); 
// Create a new list.

void list_delete(list_t* list); 
// remove a list and all of it nodes.

void list_push(list_t* list, u32 val); 
//push node at the start of the list.

u32 list_pop(list_t* list); 
//pop the first element of the list.

void list_append(list_t * list, u32 value);

void list_insert_at(list_t* list, u32 index, u32 value); 
// insert a value at a index.

void list_remove_at(list_t* list, u32 index); 
// remove a value at a index.

void list_remove_value(list_t * list, u32 value);
// remove all item of a value.

u32 list_value_at(list_t* list, u32 index); 
// Get a value at a index.