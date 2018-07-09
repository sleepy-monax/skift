#include "memory.h"
#include "kernel/kernel.h"
#include "kernel/x86.h"

gdt_entry_t    gdt[GDTSIZE];
gdt_registry_t gdt_registry;
tss_t default_tss;

bool install_gdt()
{
    // Clear the gdt.
    memset((void *)&gdt, 0, sizeof(gdt_entry_t)  * GDTSIZE);
    memset((void *)&default_tss, 0, sizeof(tss_t));

    //setup the tss.
    default_tss.debug_flag = 0x00;
	default_tss.io_map = 0x00;
	default_tss.esp0 = 0x20000;
	default_tss.ss0 = 0x18;

    init_gdt_entry(&gdt[0], 0, 0, 0, 0);                // null
    init_gdt_entry(&gdt[1], 0, 0xffffffff, 0x9B, 0x0D); // code
    init_gdt_entry(&gdt[2], 0, 0xffffffff, 0x93, 0x0D); // data
    init_gdt_entry(&gdt[3], 0, 0xffffffff, 0x97, 0x0D); // stack

    init_gdt_entry(&gdt[4], 0, 0xffffffff, 0xFF, 0x0D); // ucode
    init_gdt_entry(&gdt[5], 0, 0xffffffff, 0xF3, 0x0D); // udata
    init_gdt_entry(&gdt[6], 0, 0xffffffff, 0xF7, 0x0D); // ustack

    init_gdt_entry(&gdt[7], (u32)&default_tss, sizeof(tss_t), 0xE9, 0x00); //tss

    gdt_registry.limite = (sizeof(gdt_entry_t) * GDTSIZE) - 1;
    gdt_registry.base   = (u32)&gdt;

    asm("lgdtl (gdt_registry)");

    asm("movw $0x10, %ax \n \
    movw %ax, %ds       \n \
    movw %ax, %es       \n \
    movw %ax, %fs       \n \
    movw %ax, %gs       \n \
    ljmp $0x08, $next   \n \
    next:               \n");

    asm("	movw $0x38, %ax \n \
    ltr %ax");

    return true;
}

void init_gdt_entry(gdt_entry_t * entry, u32 base, u32 limite, u8 acces, u8 flags)
{
    entry->lim0_15  = (limite &  0xffff);
    entry->lim16_19 = (limite & 0xf0000) >> 16;

    entry->base0_15  = (base &     0xffff);
    entry->base16_23 = (base &   0xff0000) >> 16;
    entry->base24_31 = (base & 0xff000000) >> 24;

    entry->acces = acces;
    entry->flags = flags;

    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
}