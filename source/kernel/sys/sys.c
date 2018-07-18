#include "cpu/cpu.h"
#include "kernel/system.h"
#include "kernel/task.h"
#include "libc.h"

char * __kernel_name = "core-one";

int    __kernel_version_major = 0;
int    __kernel_version_minor = 1;
int    __kernel_version_patch = 0;
char * __kernel_version_codename = "babystep";

/* kernel version format major.minor.patch-codename */
char * __kernel_version_format = "%d.%d.%d-%s";


void system_setup()
{
    setup(task);
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