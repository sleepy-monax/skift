#include "cpu/cpu.h"
#include "kernel/system.h"
#include "kernel/task.h"
#include "libc.h"
#include "kernel/mm.h"

char * __kernel_name = "core-one";

int    __kernel_version_major = 0;
int    __kernel_version_minor = 1;
int    __kernel_version_patch = 0;
char * __kernel_version_codename = "babystep";

/* kernel version format major.minor.patch-codename */
char * __kernel_version_format = "%d.%d.%d-%s";
char * __kernel_uname_format = "%s %d.%d.%d-%s";


void system_setup()
{
    setup(task);
    setup(mm);
}

const char * const log_level[] = { "&7 ", " [warn] ", " &4[!!!] "};

void __log(log_level_t level, string function, string message, ...)
{
    va_list va;
    va_start(va, message);

    printf("&3[%d:%d:%d]&7", time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
    printf("%s", log_level[level]); 
    printf("&e%s&f()&7 ", function);
    printfva(message, va);
    print("\n&f");
}

void __assert_failed(string expr, string file, string function, int line)
{
    __panic(file, function, line, NULL, "Kernel assert failed: %s !", expr);
}