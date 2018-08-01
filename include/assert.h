#pragma once
#include "types.h"

#define assert(expr) \
    if (!(expr)) \
        __assert_failed( #expr, __FILE__,  (string)__FUNCTION__, __LINE__ )

extern void __assert_failed(string expr, string file, string function, int line);
        