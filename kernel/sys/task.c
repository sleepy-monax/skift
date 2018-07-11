#include "kernel/cpu.h"
#include "kernel/system.h"

#define TASK_NAME_SIZE 32

typedef struct 
{
    char name[TASK_NAME_SIZE];
    cpu_state_t cpu_state;
} task_t;

task_t * current_task;

void task_setup()
{

}
void task_create(u32 entry, string name, u8 flags)
{
    UNUSED(entry + name + flags);
}

void task_kill()
{

}

task_t * schedule()
{
    return NULL;
}
