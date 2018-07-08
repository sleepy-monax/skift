#include "device/keyboard.h"
#include "device/keymap.us.h"
#include "kernel/console.h"
#include "kernel/kernel.h"
#include "kernel/x86.h"

bool lshift_enable;
bool rshift_enable;
bool alt_enable;
bool ctrl_enable;

bool install_keyboard()
{
    add_interrupts_handler(33, &keyboard_interrupt);    

    return true;
}

void keyboard_interrupt(registry_t* reg)
{
    UNUSED(reg);
    u8 scancode = inb(0x60) - 1;

    if (scancode < 0x80) 
    {         /* touche enfoncée */
        switch (scancode) 
        {
            case 0x29:
                lshift_enable = true;
                break;
            case 0x35:
                rshift_enable = true;
                break;
            case 0x1C:
                ctrl_enable = true;
                break;
            case 0x37:
                alt_enable = true;
                break;
            default:
                kprintf("%c", kbdmap_us[scancode * 4 + (lshift_enable || rshift_enable)]);
        }
    }
    else
    {                /* touche relâchée */
        scancode -= 0x80;
        switch (scancode) 
        {
            case 0x29:
                    lshift_enable = false;
                    break;
            case 0x35:
                    rshift_enable = false;
                    break;
            case 0x1C:
                    ctrl_enable = false;
                    break;
            case 0x37:
                    alt_enable = false;
                    break;
        }
    }
}