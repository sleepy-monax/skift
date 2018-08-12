// Single Linked sllist

#include "ds/sllist.h"

Node * createnode(int data);

Node * createnode(int data){
  Node * newNode = malloc(sizeof(Node));
  newNode->data = data;
  newNode->next = NULL;
  return newNode;
}

sllist * sllist_new(){
  sllist * list = malloc(sizeof(sllist));
  list->head = NULL;
  return list;
}

void sllist_display(sllist * list) {
  Node * current = list->head;
  if(list->head == NULL) 
    return;
  while(current->next != NULL){
    printf("%d,", current->data);
    current = current->next;
  }
  printf("%d\n", current->data); 
}

void sllist_add(int data, sllist * list){
  Node * current = NULL;
  if(list->head == NULL){
    list->head = createnode(data);
  }
  else {
    current = list->head; 
    while (current->next!=NULL){
      current = current->next;
    }
    current->next = createnode(data);
  }
}

void sllist_delete(int data, sllist * list){
  Node * current = list->head;            
  Node * previous = current;           
  while(current != NULL){           
    if(current->data == data){      
      previous->next = current->next;
      if(current == list->head)
        list->head = current->next;
      free(current);
      return;
    }                               
    previous = current;             
    current = current->next;        
  }                                 
}                                   

void sllist_reverse(sllist * list){
  Node * reversed = NULL;
  Node * current = list->head;
  Node * temp = NULL;
  while(current != NULL){
    temp = current;
    current = current->next;
    temp->next = reversed;
    reversed = temp;
  }
  list->head = reversed;
}

void sllist_free(sllist * list){
  Node * current = list->head;
  Node * next = current;
  while(current != NULL){
    next = current->next;
    free(current);
    current = next;
  }
  free(list);
}

void sllist_destroy(sllist * list){
  Node * current = list->head;
  Node * next = current;
  while(current != NULL){
    next = current->next;
    free((void*)current->data);
    free(current);
    current = next;
  }
  free(list);
}