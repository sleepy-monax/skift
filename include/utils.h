#pragma once

#define PACKED(x) x __attribute__ ((packed))
#define ALIGNED(x, align) x __attribute__((aligned(align)))
#define UNUSED(x) (void)(x)
#define NEW(type) ((type *)malloc(sizeof(type)))