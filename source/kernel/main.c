#include "cpu/cpu.h"
#include "cpu/cpuid.h"
#include "device/vga.h"
#include "kernel/device.h"
#include "kernel/multiboot.h"
#include "kernel/system.h"
#include "kernel/task.h"
#include "libc.h"
#include "types.h"


void print_sysinfo(multiboot_info_t * info)
{
    major("Skift release 1 (babysteps)");
    info("kernel 0.0.1 // %s %s %dk %dm %s\n",
        cpuid_get_vendorid(),
        info->boot_loader_name,
        info->mem_lower,
        info->mem_upper / 1024,
        info->cmdline);
}

void dummy_func(char c, vga_color_t color)
{
    UNUSED(color);
    while(1)
        for(u32 i = 0; i < 80; i++)
        {
            vga_cell(i, 0, vga_entry(c, color, vga_black));  
            //printf("%c", c);
            for(u32 i = 0; i < 1000000; i++) { }
        }
        
}

void taskA() { dummy_func('A', vga_red); }
void taskB() { dummy_func('B', vga_green); }
void taskC() { dummy_func('C', vga_magenta); }

#include "device/bga.h"
#include "math.h"


void main(multiboot_info_t * info)
{
    console_setup();
    setup(heap);

    setup(cpu);
    setup(system);


    sti();
    
    print("\n");
    print_sysinfo(info);
    major("The kernel has started successfully !");

    task_start_named((task_entry_t)&taskA, "A");
    task_start_named((task_entry_t)&taskB, "B");
    task_start_named((task_entry_t)&taskC, "C");
    
    dummy_func('K', vga_blue);          

    // while(1){}
    
    panic("The end of the main function has been reached.");
}
