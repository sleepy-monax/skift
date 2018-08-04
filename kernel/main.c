#include <stdio.h>
#include <string.h>

#include "sync/atomic.h"

#include "devices/vga.h"
#include "kernel/console.h"
#include "kernel/multiboot.h"
#include "kernel/version.h"
#include "kernel/tasking.h"
#include "kernel/time.h"
#include "cpu/cpuid.h"
#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "cpu/isr.h"
#include "cpu/irq.h"

#include "kernel/logging.h"

#include "kernel/paging.h"
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

void dump_multiboot_info(multiboot_info_t * info)
{
    printf("&fMultiboot info:&7");
    printf("\n\tbootloader name: %s", info->boot_loader_name);
    printf("\n\tkernel command line: %s", info->cmdline);
    printf("\n\tmemory: LOWER=%dko, UPPER=%dko", info->mem_lower, info->mem_upper);
    printf("\n\tframebuffer: addr=%d, size=%dx%d", info->framebuffer_addr, info->framebuffer_width, info->framebuffer_height);
    print("\n");
}

void dump_kernel_info()
{
    printf("&fKernel info:&7");
    printf("\n\tkernel uname: "); printf(KERNEL_UNAME);
    print("\n");
}

void main(multiboot_info_t * info, s32 magic, u32 esp)
{
    UNUSED(esp);

    console_setup();

    mbootinfo = info;
    
    print("\n"); 

    if (magic != MULTIBOOT_BOOTLOADER_MAGIC )
    {
        panic("Invalid multiboot magic number (0x%x)!", magic);
    }

    info("--- Setting up cpu tables ---");

    setup(gdt);
    setup(pic);
    setup(idt);
    setup(isr);
    setup(irq);
    
    info("--- Setting up system ---");

    setup(task);
    task_start_named(taskclock, "clock");
    setup(mm);

    atomic_enable();
    sti();
    
    print("\n"); dump_multiboot_info(info);
    print("\n"); cpuid_dump();
    print("\n"); dump_kernel_info();

    while(true);

    panic("The end of the main function has been reached.");
}