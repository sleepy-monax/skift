#pragma once
#include "types.h"

#define PATH_SEPARATOR '/'
#define MAX_FILE_NAME_SIZE 32
#define MAX_PATH_SIZE    1024

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

typedef bool (* open_t)  (void * node);
typedef bool (* close_t) (void * node);
typedef u32  (* read_t)  (void * node, void *, u32);
typedef u32  (* write_t) (void * node, void *, u32);
typedef u32  (* ioctl_t) (void * node, u32, void *);

typedef struct 
{
    int refcount;
    node_type_t type;
    u32 size;

    open_t open;
    close_t close;
    read_t read;
    write_t write;
    ioctl_t ioctl;
    
    void * data;
} fs_node_t;

typedef struct 
{
    char name[MAX_FILE_NAME_SIZE];
    fs_node_t * node;
    void * next;
} directory_entry_t;

void fs_setup();

s32 fs_mkdir(string path);

fs_node_t * fs_open(string path, u8 flags);
s32 fs_close(fs_node_t * node);

s32 fs_read (fs_node_t * node, void * buffer, size_t size);
s32 fs_write(fs_node_t * node, void * buffer, size_t size);

s32 fs_ioctl(fs_node_t * node, u32 request, void * argp);