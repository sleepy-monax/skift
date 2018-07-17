#include "cpu/idt.h"
#include "cpu/irq.h"
#include "kernel/system.h"
#include "libc.h"

extern u32 irq_vector[];
extern bool console_bypass_lock;
irq_handler_t irq_handlers[16];

void irq_setup()
{
    for(u32 i = 0; i < 16; i++)
    {
        idt_entry(32 + i, irq_vector[i], 0x08, INTGATE);
    }   
}

irq_handler_t irq_register(int index, irq_handler_t handler)
{
    if (index < 16)
    {
        irq_handlers[index] = handler;
        return handler;
    }

    return NULL;
}

esp_t irq_handler(esp_t esp, context_t context)
{
    if (irq_handlers[context.int_no] != NULL)
    {
        return irq_handlers[context.int_no](esp, &context);
    }
    else
    {
        console_bypass_lock = true;
        printf("Unhandeled IRQ %d!\n", context.int_no);
        console_bypass_lock = false;
    }

    pic_EOI();

    return esp; // this is only use for task switching.
}