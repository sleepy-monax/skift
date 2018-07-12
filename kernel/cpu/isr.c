#include "kernel/cpu.h"
#include "kernel/system.h"

void isr_setup()
{
    for(u32 i = 0; i < 32; i++)
    {
        /* code */
    }   
}

void exeption(int interupts, int errorcode)
{
    panic("Exeption %d %f!", interupts, errorcode);
}