#include "valist.h"

#include "convert.h"

#include "device/clock.h"
#include "kernel/kernel.h"
#include "kernel/logging.h"
#include "kernel/time.h"

const char * const witty_comments[] = 
{
    "Witty comment unavailable :(",
    "Surprise! Haha. Well, this is awkward.",
    "Oh - I know what I did wrong!",
    "Uh... Did I do that?",
    "Oops.",
    "On the bright side, I bought you a teddy bear!",
    "Yo DAWG, I heard you like errors,\n\t// so i put an error in your error handler\n\t// so you can error while you error",
    "Excuse Me Sir, \n\t// Do You Have a Moment to Talk About Jesus Christ?",
    "...",
};

const char * const log_level[] = { "&9info", "&ewarn", "&4error" };

void __log(u8 level, const string function, string message, ...)
{
    cli();

    va_list va;
    va_start(va, message);

    kprintf("&3%d:%d:%d ", time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
    kprintf("&9%s &e%s&f() ", log_level[level], function); 
    kprintfva(message, va);
    kprint("\n");

    sti();
}

void __assert(const string file, const int line ,bool sucess, string assert)
{
    
    if (!sucess)
    {
        cli(); 

        kprintf("&4[ASSERT FAILED]&f at %s:%d -> ", file, line);           
        kprintf(assert); kprintf("\n"); 
        
        for(;;){hlt();};  
    }
}

void __panic(registry_t * reg, const string file, const string function, const int line, string message, ...)
{
    cli();

    va_list va;
    va_start(va, message);
    
    kprintf("\n&8--- &4!!!&8 ------------------------------------------------------------------------&f");
    
    kprintf("\n\t&4KERNEL PANIC\n\t&a// %s\n\n\t&f", witty_comments[clock_tick % 8]); 
    
    kprintfva(message, va);
    kprintf("\n\t&7at %s &e%s&f() &7ln%d", file, function, line); 
    
    kprintf("\n\n");
    kprintf("\n\t&eDiagnostic:&7");
    kprintf("\n\tThe kernel was running for %d tick.", clock_tick);

    if (reg != NULL)
    {
        __dump_register(reg);
        kprintf("\n\n");
    }
    else
    {
        kprintf("\n\n\n\n\n\n\n");
    }


    kprintf("\n\n");
    
    kprintf("\n\t&fPress any key to reboot...\n"); 

    kprintf("\n&8------------------------------------------------------------ core one v0.0.1 ---");

    for(;;){hlt();}
}

void __dump_register(registry_t * reg)
{
    kprintf("\n\tint_no=%x(%u), err_code=%x(%u)", reg->int_no, reg->int_no, reg->err_code, reg->err_code);
    kprintf("\n\teax=%x, ecx=%x, edx=%x, ebx=%x", reg->eax, reg->ecx, reg->edx, reg->ebx);
    kprintf("\n\tesp=%x, ebp=%x, esi=%x, edi=%x", reg->esp, reg->ebp, reg->esi, reg->edi);
    
    kprintf("\n\n\teip=%x, cs=%x, ef=%x, uesp=%x, ss=%x", reg->eip, reg->cs, reg->eflags, reg->useresp, reg->ss);
}

int __raise_divide_by_zero() 
{
    int dummy = 256 / string_to_uint("0", 10);
    return dummy;
}