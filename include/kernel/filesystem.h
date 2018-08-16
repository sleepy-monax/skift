#pragma once
#include "types.h"
#include "utils.h"
#include "ds/sllist.h"

#define MAX_PATH_SIZE 1024
#define MAX_NAME_SIZE 128
#define FS_PATH_SEPARATOR '/'

struct file;
struct directory;

typedef struct directory 
{
    char name[MAX_NAME_SIZE];

    sllist_t* files;
    sllist_t* directories;

    struct directory * parent;
} directory_t;

typedef struct file
{
    bool is_open;
    char name[MAX_NAME_SIZE];

    struct directory * parent;
} file_t;

void filesystem_setup();

bool dir_create(string path);
bool dir_delete(string path);
bool dir_list_file(string, char* dest, uint index);
bool dir_list_dir(string, char* dest, uint index);

bool file_create(string path);

file_t* file_open(string path, bool read, bool write, bool create);
void file_close(file_t * file);
uint file_read(file_t * file, uint offset, char * buffer, size_t size);
uint file_write(file_t * file, uint offset, char * buffer, size_t size);
bool file_delete(string path);
