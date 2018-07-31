#pragma once
#include "types.h"
#include "sync/lock.h"

typedef struct lnode
{
    struct lnode * next;
    struct lnode * prev;
    void * value;
    void * owner;
} list_node_t;

typedef struct
{
    u32 count;
    list_node_t * head;
    list_node_t * tail;
} list_t;

list_t * list_alloc();
void list_free(list_t * self); // free the data struct.
void list_destroy(list_t * self); // free the data struct and data.

void * list_push(list_t * self, void * value); // pop the first element of the list.
void * list_push_back(list_t * self, void * value); // pop the last element of the list.
void * list_pop(list_t * self);
void * list_pop_back(list_t * self);

void * list_value(list_t * list, u32 index);
void * list_remove(list_t * list, u32 index);
void * list_insert(list_t * list, u32 index, void * value);

u32 list_index_of(list_t * list, void * value);

#define LIST_FOREACH(i, list)\
    for (list_node_t * i = (list)->head; i != NULL; i = i->next)

#define LIST_FOREACHR(i, list)\
    for (list_node_t * i = (list)->tail; i != NULL; i = i->prev)
