#pragma once

#define NULL ((void*)0)

#define true 1
#define false 0

#define UNUSED(x) (void)(x)

typedef char * string;
typedef unsigned char bool;

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