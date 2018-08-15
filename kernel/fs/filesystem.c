#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "kernel/filesystem.h"

directory_t * root;

directory_t * alloc_directorie(string name)
{
    directory_t * dir = MALLOC(directory_t);
    
    strncpy((char*)&dir->name, name, MAX_NAME_SIZE);
    dir->directories = sll_new();
    dir->files = sll_new();

    return dir;
}

file_t * alloc_files(string name)
{
    file_t * file = MALLOC(file_t);
    
    strncpy((char*)&file->name, name, MAX_NAME_SIZE);

    return file;
}

/* --- Public functions ----------------------------------------------------- */

void fs_init()
{
    root = alloc_directorie("ROOT");
}

directory_t * fs_get_dir(string path, directory_t * parent)
{
    char* name = (char*)malloc(MAX_NAME_SIZE);
    name[0] = '\0';

    for(size_t i = 0; path[i] != FS_PATH_SEPARATOR && path[i]; i++)
    {
        strapd(name, path[i]);
    }

    SLL_FOREARCH(entry, parent->directories)
    {
        directory_t * dir = (directory_t*)entry->data;

        if (strcmp(name, dir->name) == 0)
        {
            return fs_get_dir(path + strlen(name), dir);
        }
    }
    
    return NULL;
}

file_t * fs_get_file(string path, directory_t * parent)
{
    UNUSED(path); UNUSED(parent);
    return NULL;
}