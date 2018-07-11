#include "kernel/cpu.h"

#define IDT_ENTRY_COUNT 0

typedef struct __attribute__ ((packed)) 
{
    u16 size;
    u32 offset;
} idt_descriptor_t;

typedef struct __attribute__ ((packed)) 
{

} idt_entry_t;

typedef struct 
{
    idt_entry_t entries[IDT_ENTRY_COUNT];
    idt_descriptor_t descriptor;
} idt_t;

idt_t idt;

void idt_setup()
{

}

void idt_entry()
{
    
}