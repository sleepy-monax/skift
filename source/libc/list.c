#include "libc.h"
#include "list.h"

list_t *list_alloc()
{
    list_t* list = (list_t *)malloc(sizeof(list_t));
    list->count = 0;
    list->head = NULL;
    return list;
}

void list_delete(list_t * list)
{
    u32 item_count = list->count;

    for (u32 i = 0; i < item_count; i++)
    {
        list_pop(list);
    }

    free(list);
}

void list_delete_items(list_t * list)
// Detroy list and all items
{
    for (u32 i = 0; i < list->count; i++)
    {
        free((void *)list_value_at(list, i));
    }

    list_delete(list);
}

void list_push(list_t *list, u32 val)
{
    list->count++;
    
    struct list_node* current_head = list->head;
    struct list_node* new_head = (struct list_node*)malloc(sizeof(struct list_node));
    
    list->head = new_head;
    
    new_head->val = val;
    new_head->next = current_head;
}

u32 list_pop(list_t *list)
{
    struct list_node* current_head = list->head;
    int value = 0;

    if (current_head != NULL)
    {
        value = current_head->val;
        struct list_node* next_node = current_head->next;
        list->head = next_node;
        free(current_head);
    }

    return value;
}

void list_append(list_t * list, u32 value)
{
    struct list_node* node = list->head;
    
    if (node == NULL) {list_push(list, value); return;}
    list->count++;

    while (node->next != NULL)
    {
        node = node->next;
    }

    node->next = (struct list_node*)malloc(sizeof(struct list_node));
    node->next->next = NULL;
    node->next->val = value;
}

void list_insert_at(list_t *list, u32 index, u32 value)
{
    struct list_node* node = list->head;
    list->count++;

    for (u32 i = 0; i < index; i++)
    {
        if (node->next)
        {
            node = node->next;
        }
    }

    struct list_node* new_node = (struct list_node*)malloc(sizeof(struct list_node));
    new_node->val = value;
    new_node->next = node->next;
    node->next = new_node;
}

void list_remove_at(list_t *list, u32 index)
{
    struct list_node* node = list->head;

    for (u32 i = 0; i < index; i++)
    {
        node = node->next;
    }

    struct list_node* node_to_remove = node->next;
    node->next = node_to_remove->next;
    free(node_to_remove);
}

void list_remove_value(list_t * list, u32 value)
{
    for (u32 i = 0; i < list->count; i++)
    {
        if (list_value_at(list, i) == value)
        {
            list_remove_at(list, i);
            return;
        }
    }
}

u32 list_value_at(list_t* list, u32 index)
{
    struct list_node* node = list->head;

    for (u32 i = 0; i < index; i++)
    {
        node = node->next;
    }

    return node->val;
}

void list_dump(list_t* list)
{
    for (u32 i = 0; i < list->count; i++)
    {
        printf("[%d] %d\n", 0xf, i, list_value_at(list, i));
    }
}