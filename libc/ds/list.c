#include <stdlib.h>

#include "ds/list.h"

/* --- Private functions ---------------------------------------------------- */

void delete_node(list_t * list, list_node_t * node)
{ 
    if (node->prev != NULL)
    {
        node->prev->next = node->next;
    }
    else
    {
        // the node is the head of the list.
        list->head = node->next;
    }

    if (node->next != NULL)
    {
        node->next->prev = node->prev;
    }
    else
    {
        // the node is the tail of the list.
        list->tail = node->prev;
    }
    
    list->count--;
    free(node);
}

void insert_node(list_t * list, list_node_t * at, list_node_t * node)
{
    if (at->prev == NULL)
    {
        node->prev = NULL;
        list->head = node;
    }
    else
    {
        node->prev = at->prev;
        at->prev->next = node;
    }

    at->prev = node;
}

/* --- Public functions ----------------------------------------------------- */
list_t * list_alloc()
{
    list_t * list = MALLOC(list_t);
    
    list->count = 0;
    list->head = NULL;
    list->tail = NULL;

    return list;
}

void * list_push(list_t * self, void * value)
{
    list_node_t * new_node = MALLOC(list_node_t);
    
    new_node->owner = self;
    new_node->value = value;
    
    new_node->next = self->head;
    new_node->prev = NULL;

    if (self->head == NULL) // the list must be empty
    {
        self->head = new_node;
        self->tail = new_node;
    }
    else
    {
        self->head->prev = new_node;
    }

    self->head = new_node;
    self->count++;

    return value;
}

void * list_push_back(list_t * self, void * value)
{
    list_node_t * new_node = MALLOC(list_node_t);
    
    new_node->owner = self;
    new_node->value = value;

    new_node->next = NULL;
    new_node->prev = self->tail;

    if (self->head == NULL) // the list must be empty
    {
        self->head = new_node;
        self->tail = new_node;
    }
    else
    {
        self->head->next = new_node;
    }

    self->tail = new_node;
    self->count++;

    return value;
}

void * list_pop(list_t * self)
{
    void * value = NULL;

    if (self->head != NULL)
    {   
        value = self->head->value;
        delete_node(self, self->head);
    }

    return value;
}

void * list_pop_back(list_t * self)
{
    void * value = NULL;

    if (self->tail != NULL)
    {   
        value = self->tail->value;
        delete_node(self, self->tail);
    }

    return value;
}
