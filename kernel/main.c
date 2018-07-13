#include "types.h"
#include "libc.h"
#include "kernel/system.h"
#include "kernel/multiboot.h"
#include "kernel/device.h"
#include "kernel/cpu.h"

void print_sysinfo(multiboot_info_t * info)
{
    print("\n");
    major("core one v0.0.1&7 - %s %dk %dm %s", info->boot_loader_name, info->mem_lower, info->mem_upper / 1024, info->cmdline);
}

void taskA()
{
    while(1)
    {
        print("&3Hi I'm task A!\n"); 
        for(u32 i = 0; i < 10000000; i++)
        {
            /* code */
        }       
    }
}

void taskB()
{
    while(1)
    {
        print("&2Hi I'm task B :)\n");

        for(u32 i = 0; i < 10000000; i++)
        {
            /* code */
        }
    }
}

void main(multiboot_info_t * info)
{
    console_setup();

    setup(cpu);
    setup(device);
    setup(system);

    task_start_named((task_entry_t)&taskA, "A");
    task_start_named((task_entry_t)&taskB, "B");

    sti();
    
    major("The kernel has started successfully !");

    print_sysinfo(info);
    
    while(1) 
    {
        print("&4Hi I'am the kernel task :D\n");
        for(u32 i = 0; i < 10000000; i++)
        {
            /* code */
        }  
    }
    panic("The end of the main function has been reached.");
}
