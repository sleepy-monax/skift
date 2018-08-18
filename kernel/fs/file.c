#include "kernel/filesystem.h"

file_t *alloc_file(const char *name)
{
    file_t *file = MALLOC(file_t);

    strncpy((char *)&file->name, name, PATH_FILE_NAME_SIZE);

    return file;
}

/* --- Create/Delete/Existe ------------------------------------------------- */

int file_create(directory_t *relative, const char *path, int flags)
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

int file_delete(directory_t *relative, const char *path)
{
}

int file_existe(directory_t *relative, const char *path)
{
}

/* --- Move/Copy ------------------------------------------------------------ */

int file_copy(directory_t *relative_s, const char *source, directory_t *relative_d, const char *destination)
{
}

int file_move(directory_t *relative_s, const char *source, directory_t *relative_d, const char *destination)
{
}

/* --- Open/Close/Read/Write ------------------------------------------------ */

file_t *file_open(directory_t *relative, const char *path)
{
}

void file_close(file_t *file)
{
}

int file_write(file_t *file, void *buffer, int n)
{
}

int file_read(file_t *file, void *buffer, int n)
{
}
