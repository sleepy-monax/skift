#pragma once

#include "types.h"
#include "valist.h"
#define KERNEL_VERSION_MAJOR 0
#define KERNEL_VERSION_MINOR 0
#define KERNEL_VERSION_PATCH 1

void kprint(string message);
void kprintf(string format, ...);
void kprintfva(string format, va_list va);