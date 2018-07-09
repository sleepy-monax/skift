#pragma once
#include "types.h"
#include "kernel/x86.h"

#define TASK_NAME_SIZE 16
#define TASK_TABLE_SIZE 256
#define TASK_STACK_SIZE 1024

typedef int tid_t;
typedef void (*entry_t)();

typedef enum
{
    STATE_FREE,
    STATE_RUNNING
} task_state_t;

typedef struct
{
    tid_t id;
    char name[TASK_NAME_SIZE];
    task_state_t state;

    u32 eip;

    u32 esp;
	u32 eax;
	u32 ecx;
	u32 edx;
	u32 ebx;
	u32 ebp;
	u32 esi;
	u32 edi;

    u8 stack[TASK_STACK_SIZE];
} task_t;

bool install_tasking();
tid_t task_start(entry_t entry, string name);
void schedule(registry_t * reg);