#pragma once
#include "types.h"

#define TASK_MAX_COUNT 16
#define TASK_NAME_SIZE 64
#define TASK_STACK_SIZE 4096

typedef u32 esp_t;
typedef int tid_t;
typedef void (*task_entry_t)();

typedef enum 
{
    TASK_RUNNING,
    TASK_DEAD, // Dead task need to free.
    TASK_FREE
} task_state_t;

typedef struct
{
    tid_t id;
    char name[TASK_NAME_SIZE];
    task_state_t state;

    u8 fpu_states[512];
    u32 esp;
    task_entry_t entry;
    u8 stack[TASK_STACK_SIZE];
} task_t;

void task_setup();
tid_t task_start(task_entry_t entry);
tid_t task_start_named(task_entry_t entry, string name);

esp_t task_shedule();

/* --- spin lock ------------------------------------------------------------ */

typedef struct 
{
    string name;
    bool locked;
} lock_t;

void lock_init(lock_t* lock, string name);
void lock_acquire(lock_t* lock);
void lock_release(lock_t* lock);
