#pragma once
#include "types.h"


/* --- asm macros ----------------------------------------------------------- */

static inline u8 inb(u16 port)
{
    u8 data;
    asm volatile("in %1,%0" : "=a" (data) : "d" (port));
    return data;
}

static inline void outb(u16 port, u8 data)
{
    asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

static inline void sti(void)
{
    asm volatile("sti");
}

static inline void cli(void)
{
    asm volatile("cli");
}

static inline void hlt(void)
{
    asm volatile("hlt");
}

static inline u32 get_cr2()
{
    u32 r;
    asm volatile("mov %%cr2, %0" : "=r" (r));
    return r;
}

static inline u32 get_cr3()
{
    u32 r;
    asm volatile("mov %%cr3, %0" : "=r" (r));
    return r;
}

static inline u32 get_eflags()
{
    u32 r;
    asm volatile("pushfl; movl (%%esp), %%eax; movl %%eax, %0; popfl;":"=m"(r)::"%eax");
    return r;
}

/* --- Global Descriptor Table ---------------------------------------------- */

#define GDTSIZE 0xff
#define INTGATE  0x8E00

typedef struct __attribute__((packed)) {
    u16 lim0_15;    
    u16 base0_15;
    u8 base16_23;
    u8 acces;
    u8 lim16_19 : 4;
    u8 flags : 4;
    u8 base24_31;
} gdt_entry_t;

typedef struct __attribute__((packed)) {
    u16 limite ;
    u32 base ;
} gdt_registry_t;

bool install_gdt();
void init_gdt_entry(gdt_entry_t * entry, u32 base, u32 limite, u8 acces, u8 flags);

/* --- ask State Segment ---------------------------------------------------- */


typedef struct __attribute__ ((packed))
{
    u16    previous_task, __previous_task_unused;
    u32    esp0;
    u16    ss0, __ss0_unused;
    u32    esp1;
    u16    ss1, __ss1_unused;
    u32    esp2;
    u16    ss2, __ss2_unused;
    u32    cr3;
    u32    eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
    u16    es, __es_unused;
    u16    cs, __cs_unused;
    u16    ss, __ss_unused;
    u16    ds, __ds_unused;
    u16    fs, __fs_unused;
    u16    gs, __gs_unused;
    u16    ldt_selector, __ldt_sel_unused;
    u16    debug_flag, io_map;
} tss_t;

extern tss_t default_tss;

/* --- interrupt Descriptor Table ------------------------------------------- */

#define IDTSIZE 0xff
#define INTGATE  0x8E00

typedef struct __attribute__((packed))
{
    u32 int_no; u32 err_code; // Interrupt number and error code (if applicable)
    u16 es, fs, gs, ds;       
    u32 edi, esi, ebp, esp, ebx, edx, ecx, eax;              // Pushed by pusha.
    u32 eip, cs, eflags, useresp, ss;  // Pushed by the processor automatically.
} registry_t;

extern u32 int_handlers[];
typedef void (*interrupt_handler_t)(registry_t* reg);

typedef struct __attribute__ ((packed)) 
{
	u16 offset0_15;
	u16 select;
	u16 type;
	u16 offset16_31;
} idt_entry_t;

typedef struct __attribute__((packed)) 
{
    u16 limite ;
    u32 base ;
} idt_registry_t;

bool install_interrupts();
void add_interrupts_handler(int interrupt, interrupt_handler_t handler);

#define PIC_WAIT() \
    do { \
      asm volatile("jmp 1f\n\t" \
                  "1:\n\t" \
                  "    jmp 2f\n\t" \
                  "2:"); \
    } while (0)


void setup_pic();