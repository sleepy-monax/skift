#include "cpu/irq.h"
#include "cpu/cpu.h"
#include "cpu/fpu.h"
#include "cpu/io.h"
#include "kernel/system.h"
#include "kernel/tasking.h"
#include "libc.h"
#include "kernel/atomic.h"
#include "string.h"

u32 system_tick = 0;
tid_t current_task = -1;
task_t tasks[TASK_MAX_COUNT];
u32 running_task_count = 0;

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
    u32 divisor = 1193180 / 500;
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
    tid_t ktid = task_start_named(NULL, "kernel");

    fpu_save((buffer8_t)&tasks[ktid].fpu_states);

    irq_register(0, (irq_handler_t)&task_shedule);
}

tid_t task_start_named(task_entry_t entry, string name)
{
    atomic_begin();

    tid_t free_task = get_task_by_state(TASK_FREE);

    if (free_task == -1) 
    {
        panic("Out of task table entries!");
        return -1;
    }
    
    task_t * task = &tasks[free_task];
    memset(task, 0, sizeof(task_t));


    task->entry = entry;

    // copy the name of the task
    memcpy((u8*)&task->name, (u8*)name, TASK_NAME_SIZE);
    task->name[TASK_NAME_SIZE - 1] = '\0';

    // Setup the stack of the task;
    task->esp = (u32)&task->stack + TASK_STACK_SIZE; 

    
    task->esp -= sizeof(context_t);
    context_t * context = (context_t*)task->esp;
    memset(context, 0, sizeof(context_t));
    
    context->eflags = 0x202;
    context->cs = 0x08;
    context->eip = (u32)entry;
    context->ds = 0x10;
    context->es = 0x10;
    context->fs = 0x10;
    context->gs = 0x10;

    task->state = TASK_RUNNING;

    if (current_task == -1) current_task = free_task;

    // Dead lock if uncommented
    debug("Task '%s' (tid %d, stack %x, entry %x)", task->name, task->id, task->stack, task->entry);
    dump_context(context);

    running_task_count++;

    atomic_end();

    return task->id;
}

esp_t task_shedule(esp_t esp) 
{
    system_tick++;
    
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
