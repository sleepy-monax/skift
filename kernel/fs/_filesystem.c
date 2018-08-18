#include <string.h>
#include <stdlib.h>

#include "lib/path.h"
#include "kernel/filesystem.h"
#include "kernel/logging.h"

directory_t *root;



directory_t *dir_read_dir(directory_t *dir, int index)
{
    SLL_FOREARCH(i, dir->directories)
    {
        if (index == 0)
        {
            return (directory_t *)i->data;
        }

        index--;
    }

    return NULL;
}

file_t *dir_read_file(directory_t *dir, int index)
{
    SLL_FOREARCH(i, dir->files)
    {
        if (index == 0)
        {
            return (file_t *)i->data;
        }

        index--;
    }

    return NULL;
}



/* --- Public functions ----------------------------------------------------- */

int dir_create(const char *path, directory_t *relative)
{
    char *dir_path = malloc(strlen(path));
    char dir_name[128];
    directory_t *dir = NULL;

    if (path_split(path, dir_path, dir_name))
    {
        directory_t *parent = fs_get_dir(dir_path, relative);
        dir = alloc_directorie(dir_name);
        dir->parent = parent;
        sll_add((u32)dir, parent->directories);
    }

    free(dir_path);
    return dir == NULL ? 0 : 1;
}

int file_create(const char *path, directory_t *relative)
{
    char *dir_path = malloc(strlen(path));
    char file_name[128];
    file_t *file = NULL;

    if (path_split(path, dir_path, file_name))
    {
        directory_t *parent = fs_get_dir(dir_path, relative);
        file = alloc_file(file_name);
        file->parent = parent;
        sll_add((u32)file, parent->files);
    }

    free(dir_path);
    return file == NULL ? 0 : 1;
}

void dump_directorie(directory_t *current, int depth)
{

    for (int i = 0; i < depth; i++)
    {
        printf("\t");
    }

    printf("&a|-%s\n&7", current->name);

    directory_t *child = NULL;
    for (size_t i = 0; (child = dir_read_dir(current, i)); i++)
    {
        dump_directorie(child, depth + 1);
    }

    file_t *file = NULL;
    for (size_t i = 0; (file = dir_read_file(current, i)); i++)
    {
        for (int y = 0; y < depth + 1; y++)
        {
            printf("\t");
        }

        printf("|-%s\n", file->name);
    }
}

void fs_dump(directory_t *root)
{
    printf("&fFiles System Dump:&7\n");
    dump_directorie(root, 1);
}
