#include "cpu/cpu.h"
#include "cpu/fpu.h"
#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "cpu/irq.h"
#include "cpu/isr.h"
#include "cpu/cpu.h"
#include "kernel/device.h"
#include "kernel/multiboot.h"
#include "kernel/system.h"
#include "kernel/tasking.h"
#include "kernel/version.h"
#include "kernel/atomic.h"
#include "libc.h"
#include "types.h"

#include "device/bga.h"
#include "device/vga.h"
#include "device/atapio.h"
#include "string.h"
#include "stdlib.h"
#include "kernel/tasking.h"
#include "kernel/memory.h"

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

    setup(fpu);
    setup(task);
    //setup(mm);

    atomic_enable();
    sti();
    
    task_start_named(taskclock, "clock");

    bga_setup();
    bga_mode(800, 600);
    
    u32 i = 0;
    while (true)
    {
        
        for(u32 y = 0; y < 600; y++)
        {
            for(u32 x = 0; x < 800; x++)
            {
                bga_pixel(x, y, (x ^ y) + i );
            }
        }

        i++;
        
    }

    panic("The end of the main function has been reached.");
}