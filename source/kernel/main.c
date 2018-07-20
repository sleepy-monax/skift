#include "cpu/cpu.h"
#include "cpu/cpuid.h"
#include "device/vga.h"
#include "kernel/device.h"
#include "kernel/multiboot.h"
#include "kernel/system.h"
#include "kernel/task.h"
#include "kernel/version.h"
#include "kernel/atomic.h"
#include "libc.h"
#include "types.h"


void print_sysinfo(multiboot_info_t * info)
{
    major(KERNEL_UNAME);
    info("%s %s %dk %dm %s\n",
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
        //for(u32 j = 0; j < 25; j++)
        for(u32 i = 0; i < 80; i++)
        {
            vga_cell(i, 0, vga_entry(c, color, vga_black));  
            //printf("%c", c);
            for(u32 i = 0; i < 10000; i++) { }
        }
        
}

void taskA() { dummy_func('A', vga_red); }
void taskB() { dummy_func('B', vga_green); }
void taskC() { dummy_func('C', vga_magenta); }

void taskclock()
{
    char buffer[80];
    while(true)
    {
        memset(buffer, 0, 80);
        printfb(buffer, " %s %s %d:%d:%d", __kernel_name, __kernel_version_codename, time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
    
        for(u32 i = 0; i < 80; i++)
        {
            vga_cell(i, 0, vga_entry(buffer[i], vga_white, vga_light_blue));  
        }
    }
}

#include "device/bga.h"
#include "math.h"


void main(multiboot_info_t * info)
{
    console_setup();
    setup(heap);
    setup(cpu);
    setup(system);
    print_sysinfo(info);
    major("The kernel has started successfully !");

    atomic_enable();
    sti();

    //task_start_named((task_entry_t)&taskA, "A");
    //task_start_named((task_entry_t)&taskB, "B");
    //task_start_named((task_entry_t)&taskC, "C");
    task_start_named((task_entry_t)&taskclock, "clock");
    
    //dummy_func('K', vga_blue);          
    
    //*((u32*)0xffffffff) = 5;

    while(true){};

    panic("The end of the main function has been reached.");
}
