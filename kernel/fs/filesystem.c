#include "kernel/filesystem.h"
#include "kernel/logging.h"

directory_t *root;

void filesystem_setup()
{
    info("Allocating root directorie.");
    root = alloc_directorie("ROOT");
}

directory_t *filesystem_get_directory(directory_t *relative, const char *path)
{
    char buffer[128];
    
    directory_t * current = relative ? relative : root;

    for (int i = 0; path_read(path, i, buffer); i++) 
    {
        if (strcmp(buffer, "..") == 0)
        {
            current = current->parent;
        }
        else if (strcmp(buffer, ".") == 0)
        {
            current = current;
        }
        else
        {
            SLL_FOREARCH(i, relative->directories)
            {
                directory_t *d = (directory_t *)i->data;
                if (strcmp(buffer, d->name) == 0)
                    current = d;
            }
        }
    }
    
    return current;
}

file_t *filesystem_get_file(directory_t *relative, const char *path)
{
    char *dir_name = malloc(strlen(path));
    char file_name[128];
    file_t *file = NULL;

    if (path_split(path, dir_name, file_name))
    {
        directory_t *dir = fs_get_dir(dir_name, relative);

        SLL_FOREARCH(i, dir->files)
        {
            file_t* f = (file_t *)i->data;
            if (strcmp(file_name, f->name) == 0)
                file = f;
        }
    }

    free(dir_name);
    return file;
}