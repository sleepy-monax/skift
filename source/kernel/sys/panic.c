#include "cpu/cpu.h"
#include "kernel/system.h"
#include "kernel/version.h"
#include "libc.h"

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

extern bool console_bypass_lock;
extern u32 system_tick;

void dump_context(context_t* context)
{
    console_bypass_lock = true;

    printf("\n\t&8GS=%x FS=%x ES=%x DS=%x \n\tEDI=%x ESI=%x EBP=%x ESP=%x \n\tEBX=%x EDX=%x ECX=%x EAX=%x \n\tINTNO=%x ERRCODE=%x EIP=%x CS=%x FLAGS=%x \n",
    context->gs , context->fs , context->es , context->ds , context->edi, context->esi, context->ebp, context->esp, context->ebx, context->edx, context->ecx, context->eax, context->int_no, context->errcode, context->eip, context->cs , context->eflags);
    console_bypass_lock = false;
}

void __panic(const string file, const string function, const int line, context_t* context, string message, ...)
{
    console_bypass_lock = true;
    cli();

    va_list va;
    va_start(va, message);
    
    printf("\n&8--- &4!!!&8 ------------------------------------------------------------------------&f\n");
    
    printf("\n\t&4KERNEL PANIC\n\t&8// %s\n\n\t&f", witty_comments[system_tick % 8]); 
    
    printfva(message, va);
    printf("\n\t&7at %s &e%s&f() &7ln%d", file, function, line); 
    


    printf("\n");
    printf("\n\t&eDiagnostic:&7");
    printf("\n\tThe system was running for %d tick.&8", system_tick);
    printf("\n");
    if (context != NULL)
    {
        dump_context(context);
    }


    printf("\n&8--------------------------------------------------------------------------------");
    printf("\r----------------------------------------------- %s ", __kernel_name);
    printf(KERNEL_VERSION);
    print(" \n");

    while(1);
}