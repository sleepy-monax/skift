/* Copyright (c) 2018 Nicolas Van Bossuyt.                                    */
/* This code is licensed under the MIT License.                               */
/* See: LICENSE.md                                                            */

#include <stdio.h>
#include <string.h>

#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "cpu/irq.h"
#include "cpu/isr.h"

#include "kernel/console.h"
#include "kernel/dumping.h"
#include "kernel/logging.h"
#include "kernel/multiboot.h"
#include "kernel/physical.h"
#include "kernel/ramdisk.h"
#include "kernel/tasking.h"
#include "kernel/time.h"
#include "kernel/version.h"

#include "sync/atomic.h"


multiboot_info_t mbootinfo;


void main(multiboot_info_t * info, s32 magic, u32 esp)
{
    UNUSED(esp);

    console_setup();

    memcpy(&mbootinfo, info, sizeof(multiboot_info_t));
    
    puts("\n"); 

    multiboot_module_t* module = (multiboot_module_t*)mbootinfo.mods_addr;
    load_ramdisk((void*)module->mod_start);

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
    
    physical_init((mbootinfo.mem_lower + mbootinfo.mem_upper) * 1024);
    //mm_setup(module->mod_end, (mbootinfo.mem_lower + mbootinfo.mem_upper) * 1024);
    setup(task);

    task_start_named(time_task, "clock");

    atomic_enable();
    sti();

    info(KERNEL_UNAME);

    while(true){ hlt(); };

    panic("The end of the main function has been reached.");
}