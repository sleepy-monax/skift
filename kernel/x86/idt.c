#include "memory.h"

#include "kernel/kernel.h"
#include "kernel/logging.h"
#include "kernel/x86.h"

static const string exception_messages[32] = {
	"Division by zero",
	"Debug",
	"Non-maskable interrupt",
	"Breakpoint",
	"Detected overflow",
	"Out-of-bounds",
	"Invalid opcode",
	"No coprocessor",
	"Double fault",
	"Coprocessor segment overrun",
	"Bad TSS",
	"Segment not present",
	"Stack fault",
	"General protection fault",
	"Page fault",
	"Unknown interrupt",
	"Coprocessor fault",
	"Alignment check",
	"Machine check",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved"
};


idt_entry_t         entries[IDTSIZE];
idt_registry_t      registry;
interrupt_handler_t handlers[IDTSIZE];

/* --- private functions ---------------------------------------------------- */

void setup_pic()
{
    /* Initialisation de ICW1 */
	outb(0x20, 0x11); PIC_WAIT();
	outb(0xA0, 0x11); PIC_WAIT();

	/* Initialisation de ICW2 */
	outb(0x21, 0x20); PIC_WAIT();	/* vecteur de depart = 32 */
	outb(0xA1, 0x70); PIC_WAIT();	/* vecteur de depart = 96 */

	/* Initialisation de ICW3 */
	outb(0x21, 0x04); PIC_WAIT();
	outb(0xA1, 0x02); PIC_WAIT();

	/* Initialisation de ICW4 */
	outb(0x21, 0x01); PIC_WAIT();
	outb(0xA1, 0x01); PIC_WAIT();

	/* masquage des interruptions */
	outb(0x21, 0x0);  PIC_WAIT();
	outb(0xA1, 0x0);  PIC_WAIT();
}

void init_idt_entry(idt_entry_t * entry, u16 selector, u32 offset, u16 type)
{
	entry->offset0_15 = (offset & 0xffff);
	entry->select = selector;
	entry->type = type;
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
	return;
}

void interrupt_handler(registry_t reg)
{
    // INFO("interrupt %d!", reg.int_no);

    if (handlers[reg.int_no] != NULL)
    {
        handlers[reg.int_no](&reg);
    }
    else if (reg.int_no < 32)
    {
		//WARN("&5Exception (%d) : %s!&f", reg.int_no, exception_messages[reg.int_no]);
        PANIC_REG(reg, "&5Exception (%d) : %s!&f", reg.int_no, exception_messages[reg.int_no]);
    }
    else
    {
        WARN("Unhandeled interrupt %d!", reg.int_no);
    }

    outb(0x20, 0x20);
}

/* --- public functions ----------------------------------------------------- */

bool install_interrupts()
{
    setup_pic();

    memset(&handlers, 0, IDTSIZE * sizeof(interrupt_handler_t));
    memset(&entries, 0, IDTSIZE * sizeof(idt_entry_t));

    for(u32 i = 0; i < IDTSIZE; i++)
    {
        if (i == 48)
        {
            init_idt_entry(&entries[i], 0x08, int_handlers[i], 0xEF00);
        }
        else
        {
            init_idt_entry(&entries[i], 0x08, int_handlers[i], INTGATE);
        }
    }
    
    registry.limite = (sizeof(idt_entry_t) * IDTSIZE);
    registry.base   = (u32)&entries;
    
    asm("lidtl (registry)");

    return true;
}

void add_interrupts_handler(int interrupt, interrupt_handler_t handler)
{
    handlers[interrupt] = handler;
}