#pragma once
#include "cpu/cpu.h"

typedef void (*isr_handler_t)(context_t *);

void irq_setup();
isr_handler_t irq_register(int index, isr_handler_t handler);