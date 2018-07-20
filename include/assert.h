#pragma once
#include "types.h"

extern void __assert_failed(string expr, string file, string function, int line)

#define ASSERT(expr) \
    if (!(expr)) \
        aFailed( #expr, __FILE__,  __FUNCTION__, __LINE__ )

        