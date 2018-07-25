#pragma once

#define NULL ((void*)0)
#define offsetof(st, m) ((size_t)&(((st *)0)->m))

typedef unsigned int size_t;

typedef long long ptrdiff_t;


#define true 1
#define false 0

#define PACKED(x) x __attribute__ ((packed))
#define ALIGNED(x, align) x __attribute__((aligned(align)))

#define UNUSED(x) (void)(x)


typedef unsigned short wchar_t;
typedef unsigned char bool;
typedef char * string;

typedef char s8;
typedef short s16;
typedef long s32;
typedef long long s64;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long long u64;

typedef unsigned char uchar;
typedef unsigned short ushort;
typedef unsigned long uint;

typedef u8  * buffer8_t;
typedef u16 * buffer16_t;
typedef u32 * buffer32_t;

typedef struct 
{
    s32 x;
    s32 y;
} spoint_t;

typedef struct 
{
    u32 x;
    u32 y;
} upoint_t;