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

directory_t * dir_getdir(directory_t * dir, string name)
{
    if (dir == NULL) return NULL;
    if (dir->directories->count == 0) return NULL;

    SLL_FOREARCH(i, dir->directories)
    {
        directory_t * child = (directory_t*)i->data;
        if (strcmp(name, child->name) == 0) return child;
    }

    return NULL;
}

file_t * dir_getfile(directory_t * dir, string name)
{
    if (dir == NULL) return NULL;
    if (dir->files->count == 0) return NULL;

    SLL_FOREARCH(i, dir->files)
    {
        file_t * file = (file_t*)i->data;
        if (strcmp(name, file->name) == 0) return file;
    }

    return NULL;
}

file_t * alloc_files(string name)
{
    file_t * file = MALLOC(file_t);
    
    strncpy((char*)&file->name, name, MAX_NAME_SIZE);

    return file;
}


/* --- Public functions ----------------------------------------------------- */

void filesystem_setup()
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


bool dir_create(string path)
{

}

bool file_create(string path)
{

}