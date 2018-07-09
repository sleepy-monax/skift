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
    cli();
    task_t * task = get_free_task();
    
    // copy the name of the task.
    memcpy((u8*)&task->name, (u8*)name, TASK_NAME_SIZE);
    task->name[TASK_NAME_SIZE - 1] = '\n';
    
    task->state = STATE_RUNNING;

    task->eip = (u32)entry;

	task->eax = 0;
	task->ecx = 0;
	task->edx = 0;
	task->ebx = 0;

    task->esp = (u32) task->stack + TASK_STACK_SIZE;
	task->ebp = (u32) task->stack;
	
    task->esi = 0;
	task->edi = 0;


    INFO("Task %d'%s' - eip=%x and esp=%x.", task->id, name, task->eip, task->esp);
    sti();
    return task->id;
}

void schedule(registry_t * regs)
{
    cli();
    tid_t next_task = get_next_task(current_task);

    // save the current task
    task_table[current_task].eip = regs->eip;

	task_table[current_task].eax = regs->eax;
	task_table[current_task].ecx = regs->ecx;
	task_table[current_task].edx = regs->edx;
	task_table[current_task].ebx = regs->ebx;

    task_table[current_task].esp = regs->esp;
	task_table[current_task].ebp = regs->ebp;
	
    task_table[current_task].esi = regs->esi;
	task_table[current_task].edi = regs->edi;

    //INFO("Switching from %d to %d.", current_task, next_task);

    regs->eip = task_table[next_task].eip;

    regs->eax = task_table[next_task].eax;
    regs->ecx = task_table[next_task].ecx;
    regs->edx = task_table[next_task].edx;
    regs->ebx = task_table[next_task].ebx;

    regs->esp = task_table[next_task].esp;
    regs->ebp = task_table[next_task].ebp;
    
    regs->esi = task_table[next_task].esi;
    regs->edi = task_table[next_task].edi;
    

    current_task = next_task;
    sti();
}