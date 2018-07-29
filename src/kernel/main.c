#include "cpu/cpu.h"
#include "cpu/fpu.h"
#include "cpu/gdt.h"
#include "cpu/idt.h"
#include "cpu/irq.h"
#include "cpu/isr.h"
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
#include "device/atapio.h"
#include "string.h"
#include "stdlib.h"
#include "kernel/tasking.h"
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
        __kernel_name, __kernel_version_codename, time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND), running_task_count, mbootinfo->mem_upper / 1024);
    
        for(u32 i = 0; i < 80; i++)
        {
            vga_cell(i, 0, vga_entry(buffer[i], vga_white, vga_light_blue));  
        }
    }
}

void dump_heap();

void main(multiboot_info_t * info)
{
    UNUSED(info);
    console_setup();

    mbootinfo = info;

    print("\n");
   
    setup(gdt);
    setup(pic);
    setup(idt);
    setup(fpu);
    setup(isr);
    setup(irq);
    setup(task);
    setup(mm);

    atomic_enable();
    sti();

    //asm("int $46");

    //asm("int $31");
    
    asm("int $32");
    asm("int $33");
    asm("int $34");
    asm("int $35");
    asm("int $36");
    asm("int $37");
    asm("int $38");
    asm("int $39");
    asm("int $40");
    asm("int $41");
    asm("int $42");
    asm("int $43");
    asm("int $44");
    asm("int $45");
    asm("int $46");
    asm("int $47");
    //asm("int $48");
    //asm("int $49");
    //asm("int $50");
    //asm("int $51");
    //asm("int $52");
    //asm("int $53");
    //asm("int $54");
    //asm("int $55");
    //asm("int $56");
    //asm("int $57");
    //asm("int $58");
    //asm("int $59");
    //asm("int $60");
    //asm("int $61");
    //asm("int $62");
    //asm("int $63");
    //asm("int $64");
    //asm("int $65");
    //asm("int $66");
    //asm("int $67");
    //asm("int $68");
    //asm("int $69");
    //asm("int $70");
    //asm("int $71");
    //asm("int $72");
    //asm("int $73");
    //asm("int $74");
    //asm("int $75");
    //asm("int $76");
    //asm("int $77");
    //asm("int $78");
    //asm("int $79");
    //asm("int $80");
    //asm("int $81");
    //asm("int $82");
    //asm("int $83");
    //asm("int $84");
    //asm("int $85");
    //asm("int $86");
    //asm("int $87");
    //asm("int $88");
    //asm("int $89");
    //asm("int $90");
    //asm("int $91");
    //asm("int $92");
    //asm("int $93");
    //asm("int $94");
    //asm("int $95");
    //asm("int $96");
    //asm("int $97");
    //asm("int $98");
    //asm("int $99");

    task_start_named(taskclock, "clock");
    //print("\033[0;34m");
    /*for(size_t i = 0; i < 16; i++)
    {
        void * p = malloc(16 + i);
        void * q = malloc(8 + i);

        memset(p, 0, 16 + i);
        memset(q, 0,  8 + i);

        free(p);
        free(q);
    }
    
    dump_heap();*/

    // char data[] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non semper lectus, ac gravida est. Pellentesque iaculis ornare erat, et sodales eros. Praesent id rhoncus leo. Donec tincidunt mi in pharetra sollicitudin. Integer scelerisque aliquam tellus et cursus. Nunc sed molestie nisl, eu viverra nunc. Etiam odio est, tempor id aliquam non, posuere non lorem. Phasellus accumsan eleifend lacus, ut pulvinar ipsum luctus in. Etiam semper arcu lacus, id tincidunt nunc interdum et. Pellentesque et tellus sed\n";
    // atapio_write(0, 0, 1, (char*)data);
    // atapio_write(0, 1, 1, (char*)data);
    // atapio_write(0, 2, 1, (char*)data);
    // atapio_write(0, 3, 1, (char*)data);
    
    while(true);
    //kshell();

    panic("The end of the main function has been reached.");
}