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
    char name[MAX_NAME_SIZE];
    bool is_open;

    struct directory * parent;
} file_t;

void fs_setup();
void fs_dump(directory_t * root);

directory_t * fs_get_dir(const char * path, directory_t * parent);
file_t * fs_get_file(const char * path, directory_t * parent);
int dir_create(const char * path, directory_t * relative);