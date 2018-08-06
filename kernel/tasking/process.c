#include <stdlib.h>

#include "utils.h"
#include "kernel/tasking.h"
#include "kernel/paging.h"
#include "kernel/memory.h"

extern page_directorie_t * kernel_pd;

process_t * process_new(int pid, bool user)
{
    process_t * proc = MALLOC(process_t);
    proc->id = pid;
    proc->user = user;
    proc->stack = malloc(PROCESS_STACK_SIZE);

    if (user)
    {
        proc->page_directorie = create_task_page_directorie();
    }
    else
    {
        proc->page_directorie = kernel_pd;
    }

    return proc;
}

void process_free(process_t * proc)
{
    if (proc->user)
    {
        destroy_task_page_directorie(proc->page_directorie);
    }
    else
    {

    }

    free(proc->stack);
    free(proc);
}