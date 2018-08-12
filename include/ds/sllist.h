#pragma once

#include <stdio.h>
#include <stdlib.h>

typedef struct node {
  int data;
  struct node * next;
} Node;

typedef struct list {
  Node * head; 
} sllist;

sllist * sllist_new();
void sllist_display(sllist * list);
void sllist_add(int data, sllist * list);
void sllist_delete(int data, sllist * list);
void sllist_reverse(sllist * list);
void sllist_free(sllist * list);
void sllist_destroy(sllist * list);