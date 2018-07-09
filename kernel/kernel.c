#include "types.h"
#include "memory.h"
#include "convert.h"

#include "device/clock.h"
#include "device/keyboard.h"
#include "device/uart.h"
#include "kernel/console.h"
#include "kernel/kernel.h"
#include "kernel/logging.h"
#include "kernel/multiboot.h"
#include "kernel/syscall.h"
#include "kernel/x86.h"
#include "kernel/tasking.h"

void task1(void)
{
    asm("mov $0x01, %eax;\
         int $0x30");
    while(1);
    return; /* never go there */
}

void taskA(void)
{
    while(true)
    {
        kprint("A");
    }
}

void taskB(void)
{
    while(true)
    {
        kprint("B");
    }
}

void main(multiboot_info_t * info)
{
    UNUSED(info);

    INSTALL(console);
    INSTALL(uart);
    INSTALL(gdt);
    INSTALL(interrupts);
    INSTALL(keyboard);
    INSTALL(syscall);
    INSTALL(tasking);
    INSTALL(clock);

    task_start(taskA, "taskA");
    task_start(taskB, "taskB");
    
    INFO("Interrupt enabled!"); sti();

    INFO("&fcore&9ONE &7v0.0.1 - \"Everything went well.\"");
    INFO("Entering user mode...");
    
    while(true)
    {
        kprint("C");
    }

    //asm("mov $0x01, %eax; int $0x30");

    /*memcpy((u8*)0x30000, (u8*)&task1, 100);

    asm("  movw %%ss, %0 \n \
      movl %%esp, %1" : "=m" (default_tss.ss0), "=m" (default_tss.esp0) : );
    
    asm("   cli \n \
            push $0x33 \n \
            push $0x30000 \n \
            pushfl \n \
            popl %%eax \n \
            orl $0x200, %%eax \n \
            and $0xffffbfff, %%eax \n \
            push %%eax \n \
            push $0x23 \n \
            push $0x0 \n \
            movl $0x20000, %0 \n \
            movw $0x2B, %%ax \n \
            movw %%ax, %%ds \n \
            iret" : "=m" (default_tss.esp0) : );*/

    PANIC("The end of the main function has been reached.");
}
