#include "cpu/cpu.h"
#include "cpu/fpu.h"
#include "cpu/io.h"
#include "kernel/system.h"
#include "kernel/task.h"
#include "libc.h"

tid_t current_task = -1;
task_t tasks[TASK_MAX_COUNT];

tid_t get_task_by_state(task_state_t state)
{
        
    for(tid_t tid = 0; tid < TASK_MAX_COUNT; tid++)
    {
        task_t * task = &tasks[tid];
        if (task->state == state) return tid;
    }

    return -1;
}

tid_t get_next_task_by_state(tid_t base, task_state_t state)
{
    
    for(u32 offset = 0; offset < TASK_MAX_COUNT; offset++)
    {
        tid_t tid = (base + offset + 1) %TASK_MAX_COUNT;
        task_t * task = &tasks[tid];
        if (task->state == state) return tid;
    }
    
    return -1;
}

void stack_push(task_t* task, u32 value)
{
    task->esp -= 4;
    *((u32*)task->esp) = value;
}

/* --- Public Functions ----------------------------------------------------- */

void task_setup()
{
    u32 divisor = 1193180 / 1000;
    outb(0x43, 0x36);
    u8 l = (u8)(divisor & 0xFF);
    u8 h = (u8)( (divisor>>8) & 0xFF );
    outb(0x40, l);
    outb(0x40, h);

    // clear the task table.
    memset(&tasks, 0, sizeof(task_t) * TASK_MAX_COUNT);

    // setup entries
    
    for(tid_t tid = 0; tid < TASK_MAX_COUNT; tid++)
    {
        task_t * task = &tasks[tid];
        task->id = tid;
        task->state = TASK_FREE;
    }

    // Create the kernel task.
    task_start_named(NULL, "kernel");
}

tid_t task_start_named(task_entry_t entry, string name)
{
    cli();

    tid_t free_task = get_task_by_state(TASK_FREE);

    if (free_task == -1) 
    {
        warn("No more free task!");
        return -1;
    }
    
    task_t * task = &tasks[free_task];

    task->entry = entry;

    // copy the name of the task
    memcpy((u8*)&task->name, (u8*)name, TASK_NAME_SIZE);
    task->name[TASK_NAME_SIZE - 1] = '\0';

    // Setup the stack of the task;
    task->esp= (u32)&task->stack + TASK_STACK_SIZE; 

    stack_push(task, 0x202); // EFLAGS
    stack_push(task, 0x08); // CS
    stack_push(task, (u32)entry); // EIP

    // things push by pushad
    stack_push(task, 0); // EDI
    stack_push(task, 0); // ESI
    stack_push(task, 0); // EBP
    stack_push(task, 0); // ESP - ignored
    stack_push(task, 0); // EBX
    stack_push(task, 0); // EDX
    stack_push(task, 0); // ECX
    stack_push(task, 0); // EAX

    stack_push(task, 0x10); // ds
    stack_push(task, 0x10); // es
    stack_push(task, 0x10); // fs
    stack_push(task, 0x10); // gs

    task->state = TASK_RUNNING;

    if (current_task == -1) current_task = free_task;

    // Dead lock if uncommented
    // info("Task '%s' with tid %d created (stack %x, entry %x).", task->name, task->id, task->stack, task->entry);

    sti();

    return task->id;
}

esp_t task_shedule(esp_t esp) 
{
    // save the state of the task.
    tasks[current_task].esp = esp;
    fpu_save((buffer8_t)&tasks[current_task].fpu_states);
    tid_t next_task = get_next_task_by_state(current_task, TASK_RUNNING);
    // Dead lock if uncommented
    //info("swtching from %s to %s.", tasks[current_task].name, tasks[next_task].name);
    current_task = next_task;
    fpu_load((buffer8_t)&tasks[current_task].fpu_states);
    return tasks[current_task].esp;
}