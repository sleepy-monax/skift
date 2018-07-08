#pragma once

#include "types.h"
#include "kernel/kernel.h"
#include "kernel/time.h"
#include "kernel/x86.h"

void __assert(const string file, const int line ,bool sucess, string assert);
void   __log(u8 level,          string function,                 string message, ...);
void __panic(registry_t * reg, string file,  string function,  int line, string message, ...);

#define TIME kprintf("&3%d:%d:%d ", time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
#define INSTALL(x)                                                             \
    do                                                                         \
    { /* hack for local variable */                                            \
        bool __result = !install_##x();                                        \
        TIME;                                                                  \
        if (__result)                                                          \
        {                                                                      \
            kprintf("&4* &fInstalling %s.\n", #x);                      \
        }                                                                      \
        else                                                                   \
        {                                                                      \
            kprintf("&2* &fInstalling %s.\n", #x);                      \
        }                                                                      \
    } while (0)                                                                \



#define INFO(a...) __log(0, (string)__FUNCTION__, a)    
#define WARN(a...) __log(1, (string)__FUNCTION__, a) 
#define ERRO(a...) __log(2, (string)__FUNCTION__, a)                                                                               

#define ASSERT(a) __assert(__FILE__, __LINE__, a, #a)
#define PANIC(a...) __panic(NULL, __FILE__, (string)__FUNCTION__, __LINE__, a) 
#define PANIC_REG(reg, a...) __panic(&reg, __FILE__, (string)__FUNCTION__, __LINE__, a)  
