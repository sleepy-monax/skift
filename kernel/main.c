#include "types.h"
#include "kernel/multiboot.h"
#include "kernel/cpu.h"
#include "kernel/device.h"
#include "kernel/system.h"

#include "libc.h"


void print_sysinfo(multiboot_info_t * info)
{
    print("\n");

    printf("&fcore one v0.0.1&7\n");
    printf("\tbootloader: %s\n", info->boot_loader_name);
    printf("\tmemory low: %dk\n", info->mem_lower);
    printf("\tmemory hight: %dk\n", info->mem_upper);
    printf("\targv: %s\n&f", info->cmdline);
}

void main(multiboot_info_t * info)
{
    UNUSED(info);
    console_setup();

    setup(cpu);
    setup(device);
    setup(system);

    major("The kernel has started successfully !");

    print_sysinfo(info);

    panic("The end of the main function has been reached.");
}