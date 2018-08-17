// This file is part of "skiftOS" licensed under the MIT License.
// See: LICENSE.md
// Project URL: github.com/maker-dev/skift

#include <stdio.h>
#include <stdlib.h>
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
#include "kernel/virtual.h"
#include "kernel/memory.h"
#include "kernel/ramdisk.h"
#include "kernel/tasking.h"
#include "kernel/time.h"
#include "kernel/modules.h"

#include "kernel/filesystem.h"

#include "devices/vga.h"

#include "sync/atomic.h"

multiboot_info_t mbootinfo;

void boot_screen(string msg)
{
    vga_clear(vga_white, vga_black);
    vga_text(36, 10, "skift OS", vga_light_blue, vga_black);
    vga_text(40 - strlen(msg) / 2, 14, msg, vga_white, vga_black);
}

void main(multiboot_info_t * info, s32 magic)
{
    console_setup();

    memcpy(&mbootinfo, info, sizeof(multiboot_info_t));
    
    puts("\n"); 

    if (magic != MULTIBOOT_BOOTLOADER_MAGIC ) 
        panic("Invalid multiboot magic number (0x%x)!", magic);

    //boot_screen("Setting up CPU...");
    info("--- Setting up cpu tables ---");
    setup(gdt);
    setup(pic);
    setup(idt);
    setup(isr);
    setup(irq);
    
    //boot_screen("Setting up system...");
    info("--- Setting up system ---");
    setup(physical, (mbootinfo.mem_lower + mbootinfo.mem_upper) * 1024);
    setup(memory, module->mod_end);
    setup(task);
    
    task_start_named(time_task, "clock");

    atomic_enable();
    sti();


    setup(filesystem);
    setup(modules, &mbootinfo);

    info(KERNEL_UNAME);
    //boot_screen("booting...");
    
    while(true){ hlt(); };

    panic("The end of the main function has been reached.");
}
