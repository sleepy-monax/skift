#include "kernel/cpu.h"
#include "libc.h"

#define INTGATE  0x8E00
#define IDT_ENTRY_COUNT 256

typedef struct __attribute__ ((packed)) 
{
    u16 size;
    u32 offset;
} idt_descriptor_t;

typedef struct __attribute__ ((packed)) 
{
    u16 offset0_15; // offset bits 0..15
    u16 selector; // a code segment selector in GDT or LDT
    u8 zero;      // unused, set to 0
    u8 type_attr; // type and attributes
    u16 offset16_31; // offset bits 16..31
} idt_entry_t;

typedef struct 
{
    idt_entry_t entries[IDT_ENTRY_COUNT];
    idt_descriptor_t descriptor;
    int_handler_t handlers[IDT_ENTRY_COUNT];
} idt_t;

idt_t idt;

// define in interupts.S
extern u32 int_handlers[];

extern void load_idt(u32);

void idt_setup()
{
    // cleanup the idt.
    memset(&idt, 0, sizeof(idt_t));

    // setup the descriptor.
    idt.descriptor.offset = (u32)&idt.entries;
    idt.descriptor.size = sizeof(idt_entry_t) * IDT_ENTRY_COUNT;

    // load the idt
    load_idt((u32)&idt.descriptor);
}

void idt_entry(u8 index, u32 offset, u16 selector, u16 type)
{
    UNUSED(index + offset + selector + type);
    return;
    idt_entry_t * entry = &idt.entries[index];

    entry->zero = 0;
    entry->offset0_15 = offset & 0xffff;
    entry->offset16_31 = (offset>>16) & 0xffff;
}

void interrupt_handler(void){}