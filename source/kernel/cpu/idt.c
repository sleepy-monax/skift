#include "libc.h"
#include "cpu/cpu.h"
#include "cpu/idt.h"
#include "cpu/io.h"
#include "cpu/exception.h"
#include "kernel/system.h"

idt_t idt;

// define in interupts.S
extern u32 int_handlers[];
extern void load_idt(u32);

void idt_setup()
{
    pic_setup();

    // cleanup the idt.
    memset(&idt, 0, sizeof(idt_t));

    // setup the descriptor.
    idt.descriptor.offset = (u32)&idt.entries;
    idt.descriptor.size = sizeof(idt_entry_t) * IDT_ENTRY_COUNT;

    
    for(u32 i = 0; i < IDT_ENTRY_COUNT; i++)
    {
        idt_entry(i, int_handlers[i], 0x08, INTGATE);
    }
    

    // load the idt
    load_idt((u32)&idt.descriptor);
}

void idt_entry(u8 index, u32 offset, u16 selector, u16 type)
{
    UNUSED(index + offset + selector + type);

    idt_entry_t * entry = &idt.entries[index];

    entry->offset0_15 = offset & 0xffff;
    entry->offset16_31 = (offset>>16) & 0xffff;

    entry->selector = selector;
    entry->type_attr = type | 0x80;
}

void interrupt_handler(context_t regs)
{
    if (regs.int_no < 32)
    {
        exception_handler(&regs);
    }

    info("Interrupt %d %d!", regs.int_no, regs.errcode);
    outb(0x20, 0x20);
}