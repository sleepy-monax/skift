#include <stdio.h>
#include "types.h"
#include "kernel/logging.h"

void backtrace(uint esp)
{
    UNUSED(esp);
    warn("Backtrace not implemented!");
}