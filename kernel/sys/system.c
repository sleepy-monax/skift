#include "kernel/system.h"
#include "libc.h"

void system_setup()
{

}

const char * const log_level[] = { "&f", "&7", "&e", "&4"};

void __log(log_level_t level, string message, ...)
{
    va_list va;
    va_start(va, message);

    printf("&3%d:%d:%d ", time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
    printf("%s", log_level[level]); 
    printfva(message, va);
    print("\n&f");
}

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

void __panic(const string file, const string function, const int line, string message, ...)
{
    va_list va;
    va_start(va, message);
    
    printf("\n&8--- &4!!!&8 ------------------------------------------------------------------------&f\n");
    
    printf("\n\t&4KERNEL PANIC\n\t&8// %s\n\n\t&f", witty_comments[0 % 8]); 
    
    printfva(message, va);
    printf("\n\t&7at %s &e%s&f() &7ln%d", file, function, line); 
    
    printf("\n\n");
    printf("\n\t&eDiagnostic:&7");
    printf("\n\tThe kernel was running for %d tick.", -1);


    //printf("\n\n\n\n\n\n\n");
    printf("\n\n");
    
    printf("\n\t&fPress any key to reboot...\n"); 

    printf("\n&8------------------------------------------------------------ core one v0.0.1 ---\n");
}