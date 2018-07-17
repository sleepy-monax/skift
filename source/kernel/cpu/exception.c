#include "libc.h"
#include "cpu/exception.h"
#include "cpu/idt.h"
#include "kernel/system.h"

static const char *exception_messages[32] = {
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

void dump_registers(context_t * regs)
{
	printf("EIP=%x CR0=%x", regs->eip, CR0());
}

void exception_handler(context_t * regs)
{
	dump_registers(regs);
    panic("CPU exception %s (%x:%x)!", exception_messages[regs->int_no], regs->int_no, regs->errcode);
}
