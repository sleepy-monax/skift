#include <stdlib.h>

#include "utils.h"
#include "kernel/tasking.h"
#include "kernel/paging.h"
#include "kernel/memory.h"

extern page_directorie_t *kernel_page_directorie;

process_t *process_new(int pid, bool user)
{
    process_t *proc = MALLOC(process_t);
    proc->id = pid;
    proc->user = user;
    proc->stack = malloc(PROCESS_STACK_SIZE);

    if (user)
    {
        proc->page_directorie = paging_new_user_directorie();
    }
    else
    {
        proc->page_directorie = kernel_page_directorie;
    }

    return proc;
}

void process_free(process_t *proc)
{
    if (proc->user)
    {
        paging_free_user_directorie(proc->page_directorie);
    }
    else
    {
    }

    free(proc->stack);
    free(proc);
}