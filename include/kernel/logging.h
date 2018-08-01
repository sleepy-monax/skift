#pragma once
#include "types.h"
#include "cpu/cpu.h"

typedef enum 
{
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_PANIC
} log_level_t;

#define debug(x...) __debug((string)__FUNCTION__, x)
#define info(x...) __log(LOG_INFO, (string)__FUNCTION__, x)
#define warn(x...) __log(LOG_WARNING, (string)__FUNCTION__, x)
#define error(x...) __log(LOG_ERROR, (string)__FUNCTION__, x)

#define setup(x) { x##_setup(); info("Setting up " #x "..."); }

#define cpanic(context, x...) __panic(__FILE__, (string)__FUNCTION__, __LINE__, context, x) 
#define panic(x...) __panic(__FILE__, (string)__FUNCTION__, __LINE__, NULL, x) 

void __debug(string function, string message, ...);
void __log(log_level_t level, string function, string message, ...);
void __panic(const string file, const string function, const int line, context_t * context, string message, ...);
void __assert_failed(string expr, string file, string function, int line);