#include "cpu/idt.h"
#include "cpu/io.h"

#define PIC_WAIT() \
    do { \
      asm volatile("jmp 1f\n\t" \
                  "1:\n\t" \
                  "    jmp 2f\n\t" \
                  "2:"); \
    } while (0)

void pic_setup()
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