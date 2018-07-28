#include "cpu/fpu.h"
#include "libc.h"
#include "string.h"

void fpu_init(void)
{
	asm volatile ("fninit");
}

void fpu_enable(void) 
{
	asm volatile ("clts");
	u32 t;
	asm volatile ("mov %%cr0, %0" : "=r"(t));
	t &= ~(1 << 2);
	t |= (1 << 1);
	asm volatile ("mov %0, %%cr0" :: "r"(t));

	asm volatile ("mov %%cr4, %0" : "=r"(t));
	t |= 3 << 9;
	asm volatile ("mov %0, %%cr4" :: "r"(t));
}

/* --- Public functions ----------------------------------------------------- */
// the fpu state buffer need to be alligned.
u8 buffer[512] __attribute__((aligned(16)));

void fpu_setup()
{
    fpu_enable();
    fpu_init();
}

void fpu_save(buffer8_t state)
{
    asm volatile ("fxsave (%0)" :: "r"(buffer));
	memcpy(state,&buffer,512);
}

void fpu_load(buffer8_t state)
{
	memcpy(buffer, state,512);
	asm volatile ("fxrstor (%0)" :: "r"(buffer));
}