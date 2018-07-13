#pragma once
#include "types.h"

#define FS_NAME_SIZE 16

typedef enum 
{
    FS_NODE_FILE;
    FS_NODE_DIRECTORY;
} fsnode_type_t;

typedef PACKED(struct) 
{
    fsnode_type_t type;
} fsnode_t;

typedef PACKED(struct)
{
    u32 fsnode;
    char name[FS_NAME_SIZE];
} direntry_t;