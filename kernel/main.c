#include <stdio.h>
#include <string.h>

#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "cpu/irq.h"
#include "cpu/isr.h"

#include "kernel/console.h"
#include "kernel/dumping.h"
#include "kernel/logging.h"
#include "kernel/memory.h"
#include "kernel/multiboot.h"
#include "kernel/paging.h"
#include "kernel/tasking.h"
#include "kernel/time.h"

#include "sync/atomic.h"


multiboot_info_t mbootinfo;


void main(multiboot_info_t * info, s32 magic, u32 esp)
{
    UNUSED(esp);

    console_setup();

    memcpy(&mbootinfo, info, sizeof(multiboot_info_t));
    
    puts("\n"); 

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
    setup(mm);
    setup(task);

    task_start_named(time_task, "clock");

    atomic_enable();
    sti();


    while(true){ hlt(); };

    panic("The end of the main function has been reached.");
}