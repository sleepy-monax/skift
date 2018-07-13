// pio ide disk driver

#include "libc.h"
#include "device/ide.h"
#include "kernel/cpu.h"
#include "kernel/task.h"

#define IDE_SECTOR_SIZE 512

lock_t ide_lock;

void ide_setup()
{
    lock_init(&ide_lock, "ide");
}

void ide_wait()
{
    /* Wait for the drive to signal that it's ready: */
    while (!(inb(0x1F7) & 0x08));
}

void ide_common(u8 device, u32 block, u8 count)
{
    outb(0x1F1, 0x00);      /* NULL byte to port 0x1F1 */
    outb(0x1F2, count);     /* Sector count */
    outb(0x1F3, (u8) block);  /* Low 8 bits of the block address */
    outb(0x1F4, (u8) (block >> 8));   /* Next 8 bits of the block address */
    outb(0x1F5, (u8) (block >> 16));  /* Next 8 bits of the block address */

    /* Drive indicator, magic bits, and highest 4 bits of the block address */
    outb(0x1F6, 0xE0 | (device << 4) | ((block >> 24) & 0x0F));
}

void ide_read_block(u8 device, u32 block, u8 count, buffer16_t buffer)
{
    lock_acquire(&ide_lock);


        ide_common(device, block, count);
        outb(0x1F7, 0x20);
        ide_wait();

        for (u32 i = 0; i < IDE_SECTOR_SIZE * count; i++) 
        {   
            //printf("Reading word %i\n", i);
            buffer[i] = inw(0x1F0);
        }


    lock_release(&ide_lock);
}

void ide_write_block(u8 device, u32 block, u8 count, buffer16_t buffer)
{
    lock_acquire(&ide_lock);


        ide_common(device, block, count);
        outb(0x1F7, 0x30);
        ide_wait();

        for (u32 i = 0; i < IDE_SECTOR_SIZE * count; i++) 
        {
            //printf("Writing word %i\n", i);
            outw(0x1F0, *(buffer + i));
        }


    lock_release(&ide_lock);
}