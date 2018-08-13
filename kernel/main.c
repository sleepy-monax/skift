/* Copyright (c) 2018 Nicolas Van Bossuyt.                                    */
/* This code is licensed under the MIT License.                               */
/* See: LICENSE.md                                                            */

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
#include "kernel/version.h"

#include "devices/vga.h"

#include "sync/atomic.h"


multiboot_info_t mbootinfo;


void boot_screen(string msg)
{
    vga_clear(vga_white, vga_black);
    vga_text(36, 10, "skift OS", vga_light_yellow, vga_black);
    vga_text(35, 14, "Booting...", vga_white, vga_black);
    vga_text(2, 4, msg, vga_white, vga_black);
}

void main(multiboot_info_t * info, s32 magic)
{
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
    
    setup(physical, (mbootinfo.mem_lower + mbootinfo.mem_upper) * 1024);
    setup(memory, module->mod_end);
    
    setup(task);
    
    //task_start_named(time_task, "clock");

    atomic_enable();
    sti();


    info(KERNEL_UNAME);
    

    void * p = malloc(128);
    free(p);

    boot_screen("Hello world!");
    while(true){ hlt(); };

    panic("The end of the main function has been reached.");
}