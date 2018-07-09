#include "memory.h"
#include "kernel/tasking.h"
#include "kernel/logging.h"

tid_t current_task = 0;
task_t task_table[TASK_TABLE_SIZE];

tid_t get_next_task(tid_t start)
{
    for(tid_t i = 0; i < TASK_TABLE_SIZE; i++)
    {
        if (task_table[(start + i + 1) % TASK_TABLE_SIZE].state == STATE_RUNNING)
        {
            return task_table[(start + i + 1) % TASK_TABLE_SIZE].id;
        }
    }

    return start;
}

task_t * get_free_task()
{
    for(tid_t i = 0; i < TASK_TABLE_SIZE; i++)
    {
        task_t * selected = &task_table[i];

        if (selected->state == STATE_FREE)
        {
            return selected;
        }
    }  

    return NULL;
}

/* --- public functions ----------------------------------------------------- */

bool install_tasking()
{ 
    for(u32 i = 0; i < TASK_TABLE_SIZE; i++)
    {
        task_table[i].id = i;
        task_table[i].state = STATE_FREE;
    }

    // Setup a dummy task for the kernel
    task_start(NULL, "kernel");

    return true;
}

tid_t task_start(entry_t entry, string name)
{
    task_t * task = get_free_task();
    
    // copy the name of the task.
    memcpy((u8*)&task->name, (u8*)name, TASK_NAME_SIZE);
    task->name[TASK_NAME_SIZE - 1] = '\n';
    
    task->state = STATE_RUNNING;

    task->regs.eip = (u32)entry;
    task->regs.eflags = get_eflags();
    //task->regs.cr3 = get_cr3();
    task->regs.ds = 0x10;
    task->regs.es = 0x10;
    task->regs.fs = 0x10;
    task->regs.gs = 0x10;

    task->regs.cs = 0x8;

    task->regs.ebp = (u32) task->stack;
    task->regs.esp = (u32) task->stack + TASK_STACK_SIZE;

    INFO("Task %d'%s' - eip=%x and esp=%x.", task->id, name, task->regs.eip, task->regs.esp);

    return task->id;
}

void schedule(registry_t * reg)
{
    UNUSED(reg);
    tid_t next_task = get_next_task(current_task);

    // save the current task
    memcpy((u8*)&task_table[current_task].regs, (u8*)reg, sizeof(registry_t));

    INFO("Switching from %d to %d.", current_task, next_task);

    if (next_task != current_task)
    {
        memcpy((u8*)reg, (u8*)&task_table[next_task].regs, sizeof(registry_t));
    }

    current_task = next_task;
}