#include <stdio.h>
#include <string.h>

#include "sync/atomic.h"

#include "devices/vga.h"
#include "kernel/console.h"
#include "kernel/multiboot.h"
#include "kernel/version.h"
#include "kernel/tasking.h"
#include "kernel/time.h"
#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "cpu/isr.h"
#include "cpu/irq.h"

#include "kernel/logging.h"

extern u32 running_task_count;
multiboot_info_t * mbootinfo;

void taskclock()
{
    char buffer[80];
    while(true)
    {
        memset(buffer, 0, 80);
        printfb(buffer, " [ %s '%s' ] [ %d:%d:%d ] [ %d tasks ] [ %dmo ]",
        __kernel_name, __kernel_version_codename, 
        time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND),
        running_task_count, (mbootinfo->mem_lower + mbootinfo->mem_upper) / 1024);
    
        for(u32 i = 0; i < 80; i++)
        {
            vga_cell(i, 0, vga_entry(buffer[i], vga_white, vga_light_blue));  
        }
    }
}

void dump_heap();

void main(multiboot_info_t * info)
{
    UNUSED(info);
    console_setup();

    mbootinfo = info;

    print("\n");
   
    setup(gdt);
    setup(pic);
    setup(idt);
    setup(isr);
    setup(irq);

    setup(task);
    task_start_named(taskclock, "clock");
    //setup(mm);

    atomic_enable();
    sti();
    

    while(true) print("\rhello");

    panic("The end of the main function has been reached.");
}