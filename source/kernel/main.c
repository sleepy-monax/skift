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
#include "string.h"
#include "stdlib.h"

extern u32 running_task_count;
void taskclock()
{
    char buffer[80];
    while(true)
    {
        memset(buffer, 0, 80);
        printfb(buffer, " [ %s '%s' ] [ %d:%d:%d ] [ %d tasks ]", __kernel_name, __kernel_version_codename, time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND), running_task_count);
    
        for(u32 i = 0; i < 80; i++)
        {
            vga_cell(i, 0, vga_entry(buffer[i], vga_white, vga_light_blue));  
        }
    }
}

void main(multiboot_info_t * info)
{
    UNUSED(info);
    console_setup();

    print("\n");
    setup(cpu);
    setup(system);
    atomic_enable();
    sti();

    task_start_named(taskclock, "clock");

    void * p = malloc(256);
    free(p + 4);

    while(true);
    kshell();

    panic("The end of the main function has been reached.");
}
