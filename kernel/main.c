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

void main(multiboot_info_t * info)
{
    console_setup();

    setup(cpu);
    setup(device);
    setup(system);

    sti();
    
    major("The kernel has started successfully !");

    print_sysinfo(info);



    while(1) {}
    panic("The end of the main function has been reached.");
}
