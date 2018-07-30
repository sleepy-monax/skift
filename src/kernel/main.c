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

void main(multiboot_info_t * info)
{
    UNUSED(info);
    console_setup();

    mbootinfo = info;

    print("\n");
   
    setup(gdt);
    //setup(pic);
    setup(idt);
    //setup(fpu);
    setup(isr);
    //setup(irq);
    //setup(task);
    //setup(mm);

    atomic_enable();
    sti();
    
    //task_start_named(taskclock, "clock");
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
asm("int $35");
/*
// asm("int $49");
asm("int $50");
asm("int $51");
asm("int $52");
asm("int $53");
asm("int $54");
asm("int $55");
asm("int $56");
asm("int $57");
asm("int $58");
asm("int $59");
asm("int $60");
asm("int $61");
asm("int $62");
asm("int $63");
asm("int $64");
asm("int $65");
asm("int $66");
asm("int $67");
asm("int $68");
asm("int $69");
asm("int $70");
asm("int $71");
asm("int $72");
asm("int $73");
asm("int $74");
asm("int $75");
asm("int $76");
asm("int $77");
asm("int $78");
asm("int $79");
asm("int $80");
asm("int $81");
asm("int $82");
asm("int $83");
asm("int $84");
asm("int $85");
asm("int $86");
asm("int $87");
asm("int $88");
asm("int $89");
asm("int $90");
asm("int $91");
asm("int $92");
asm("int $93");
asm("int $94");
asm("int $95");
asm("int $96");
asm("int $97");
asm("int $98");
asm("int $99");
asm("int $100");
asm("int $101");
asm("int $102");
asm("int $103");
asm("int $104");
asm("int $105");
asm("int $106");
asm("int $107");
asm("int $108");
asm("int $109");
asm("int $110");
asm("int $111");
asm("int $112");
asm("int $113");
asm("int $114");
asm("int $115");
asm("int $116");
asm("int $117");
asm("int $118");
asm("int $119");
asm("int $120");
asm("int $121");
asm("int $122");
asm("int $123");
asm("int $124");
asm("int $125");
asm("int $126");
asm("int $127");
asm("int $128");
asm("int $129");
asm("int $130");
asm("int $131");
asm("int $132");
asm("int $133");
asm("int $134");
asm("int $135");
asm("int $136");
asm("int $137");
asm("int $138");
asm("int $139");
asm("int $140");
asm("int $141");
asm("int $142");
asm("int $143");
asm("int $144");
asm("int $145");
asm("int $146");
asm("int $147");
asm("int $148");
asm("int $149");
asm("int $150");
asm("int $151");
asm("int $152");
asm("int $153");
asm("int $154");
asm("int $155");
asm("int $156");
asm("int $157");
asm("int $158");
asm("int $159");
asm("int $160");
asm("int $161");
asm("int $162");
asm("int $163");
asm("int $164");
asm("int $165");
asm("int $166");
asm("int $167");
asm("int $168");
asm("int $169");
asm("int $170");
asm("int $171");
asm("int $172");
asm("int $173");
asm("int $174");
asm("int $175");
asm("int $176");
asm("int $177");
asm("int $178");
asm("int $179");
asm("int $180");
asm("int $181");
asm("int $182");
asm("int $183");
asm("int $184");
asm("int $185");
asm("int $186");
asm("int $187");
asm("int $188");
asm("int $189");
asm("int $190");
asm("int $191");
asm("int $192");
asm("int $193");
asm("int $194");
asm("int $195");
asm("int $196");
asm("int $197");
asm("int $198");
asm("int $199");
asm("int $200");
asm("int $201");
asm("int $202");
asm("int $203");
asm("int $204");
asm("int $205");
asm("int $206");
asm("int $207");
asm("int $208");
asm("int $209");
asm("int $210");
asm("int $211");
asm("int $212");
asm("int $213");
asm("int $214");
asm("int $215");
asm("int $216");
asm("int $217");
asm("int $218");
asm("int $219");
asm("int $220");
asm("int $221");
asm("int $222");
asm("int $223");
asm("int $224");
asm("int $225");
asm("int $226");
asm("int $227");
asm("int $228");
asm("int $229");
asm("int $230");
asm("int $231");
asm("int $232");
asm("int $233");
asm("int $234");
asm("int $235");
asm("int $236");
asm("int $237");
asm("int $238");
asm("int $239");
asm("int $240");
asm("int $241");
asm("int $242");
asm("int $243");
asm("int $244");
asm("int $245");
asm("int $246");
asm("int $247");
asm("int $248");
asm("int $249");
asm("int $250");
asm("int $251");
asm("int $252");
asm("int $253");
asm("int $254");
asm("int $255");*/


    char data[] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non semper lectus, ac gravida est. Pellentesque iaculis ornare erat, et sodales eros. Praesent id rhoncus leo. Donec tincidunt mi in pharetra sollicitudin. Integer scelerisque aliquam tellus et cursus. Nunc sed molestie nisl, eu viverra nunc. Etiam odio est, tempor id aliquam non, posuere non lorem. Phasellus accumsan eleifend lacus, ut pulvinar ipsum luctus in. Etiam semper arcu lacus, id tincidunt nunc interdum et. Pellentesque et tellus sed\n";
    atapio_write(0, 0, 1, (char*)data);
    atapio_write(0, 1, 1, (char*)data);
    atapio_write(0, 2, 1, (char*)data);
    atapio_write(0, 3, 1, (char*)data);
    

    while(true);
    //kshell();

    panic("The end of the main function has been reached.");
}