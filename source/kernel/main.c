#include "types.h"
#include "libc.h"
#include "kernel/cpu.h"
#include "kernel/device.h"
#include "kernel/multiboot.h"
#include "kernel/system.h"
#include "kernel/task.h"

#include "kernel/kobject.h"

void print_sysinfo(multiboot_info_t * info)
{
    print("\n");
    major("core one v0.0.1&7 - %s %dk %dm %s", info->boot_loader_name, info->mem_lower, info->mem_upper / 1024, info->cmdline);
}

// void taskA()
// {
//     while(1)
//     {
//         print("&c[A] ");     
//         for(u32 i = 0; i < 1000; i++);       
//     }
// }

// void taskB()
// {
//     while(1)
//     {
//         print("&b[B] ");
//         for(u32 i = 0; i < 1000; i++);       
//     }
// }

void main(multiboot_info_t * info)
{
    console_setup();

    setup(heap);
    setup(kobject);

    setup(cpu);
    setup(device);
    setup(system);

    // task_start_named((task_entry_t)&taskA, "A");
    // task_start_named((task_entry_t)&taskB, "B");

    sti();
    
    major("The kernel has started successfully !");

    print_sysinfo(info);
    
    // while(1) 
    // {
    //     print("&a[K] "); 
    //     
    //     for(u32 i = 0; i < 1000; i++);        
    // }
    while(1){}
    panic("The end of the main function has been reached.");
}
