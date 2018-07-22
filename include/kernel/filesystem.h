#pragma once
#include "types.h"

#define MAX_FILE_SIZE 32
typedef enum 
{
    NODE_FILE,
    NODE_DIR,
    NODE_DEVICE_CHAR,
    NODE_DEVICE_BLOCK,
    NODE_PIPE,
    NODE_SYMLINK,
    NODE_MOUNTPOINT
} node_type_t;

#define CREATE 1 << 0;
#define READ   1 << 1;
#define WRITE  1 << 2;
#define CLEAR  1 << 3;

typedef struct 
{
    node_type_t type;
    u32 size;
    void * data;
} fs_node_t;

typedef struct 
{
    char name[MAX_FILE_SIZE];
    fs_node_t * node;
} directory_entry_t;

u32 open(string path, u8 flags);
void close(u32 file);
u32 write(u32 file, buffer8_t buffer, size_t size);
u32 read(u32 file, buffer8_t buffer, size_t size);
u32 fseek(u32 file, u32 pos);