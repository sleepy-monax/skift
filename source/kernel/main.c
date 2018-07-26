#include "cpu/cpu.h"
#include "kernel/device.h"
#include "kernel/multiboot.h"
#include "kernel/system.h"
#include "kernel/tasking.h"
#include "kernel/version.h"
#include "kernel/atomic.h"
#include "libc.h"
#include "types.h"

#include "device/vga.h"
#include "device/atapio.h"
#include "string.h"
#include "stdlib.h"

extern u32 running_task_count;
multiboot_info_t * mbootinfo;

void taskclock()
{
    char buffer[80];
    while(true)
    {
        memset(buffer, 0, 80);
        printfb(buffer, " [ %s '%s' ] [ %d:%d:%d ] [ %d tasks ] [ %dmo ]",
        
        __kernel_name, __kernel_version_codename, time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND), running_task_count, mbootinfo->mem_upper / 1024);
    
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
    setup(cpu);
    setup(system);
    atomic_enable();
    sti();

    //asm("int $0");
    //task_start_named(taskclock, "clock");

    /*for(size_t i = 0; i < 16; i++)
    {
        void * p = malloc(16 + i);
        void * q = malloc(8 + i);

        memset(p, 0, 16 + i);
        memset(q, 0,  8 + i);

        free(p);
        free(q);
    }
    
    dump_heap();*/

    char data[] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non semper lectus, ac gravida est. Pellentesque iaculis ornare erat, et sodales eros. Praesent id rhoncus leo. Donec tincidunt mi in pharetra sollicitudin. Integer scelerisque aliquam tellus et cursus. Nunc sed molestie nisl, eu viverra nunc. Etiam odio est, tempor id aliquam non, posuere non lorem. Phasellus accumsan eleifend lacus, ut pulvinar ipsum luctus in. Etiam semper arcu lacus, id tincidunt nunc interdum et. Pellentesque et tellus sed.";
    atapio_write(0, 0, 1, (char*)data);
    atapio_write(0, 0, 1, (char*)data);
    atapio_write(0, 0, 1, (char*)data);
    atapio_write(0, 0, 1, (char*)data);
    //while(true);
    //kshell();

    panic("The end of the main function has been reached.");
}