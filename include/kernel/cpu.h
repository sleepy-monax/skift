#pragma once
#include "types.h"

#define cli() asm volatile("cli");
#define sti() asm volatile("sti");
#define hlt() asm volatile("hlt");

u8   inb (u16 port);
void outb(u16 port, u8 data);
u16  inw (u16 port);
void outw(u16 port, u16 data);

void cpu_setup();

/* --- GDT ------------------------------------------------------------------ */

void gdt_setup();
void gdt_entry(int index, u32 base, u32 limit, u8 access, u8 flags);
void gdt_tss_entry(int index, u16 ss0, u32 esp0);

void gdt_dump();
void gdt_entry_dump(int index);
void set_kernel_stack(u32 stack);

typedef PACKED(struct)
{
	u32	prev_tss;
	u32	esp0;
	u32	ss0;
	u32	esp1;
	u32	ss1;
	u32	esp2;
	u32	ss2;
	u32	cr3;
	u32	eip;
	u32	eflags;
	u32	eax;
	u32	ecx;
	u32	edx;
	u32	ebx;
	u32	esp;
	u32	ebp;
	u32	esi;
	u32	edi;
	u32	es;
	u32	cs;
	u32	ss;
	u32	ds;
	u32	fs;
	u32	gs;
	u32	ldt;
	u16	trap;
	u16	iomap_base;
} tss_t;

/* --- IDT ------------------------------------------------------------------ */

// Gate call protection. 
// Specifies which privilege Level the calling Descriptor minimum should have. 
#define DPL_KERNEL 0b00000000 // ring 0
#define DPL_USER   0b01100000 // ring 1

typedef PACKED(struct)
{

} cpu_state_t;

typedef void (*int_handler_t)(cpu_state_t * states);
void exeption(int interupts, int errorcode);
void pic_setup();
void idt_setup();
void idt_entry(u8 index, u32 offset, u16 selector, u16 type);