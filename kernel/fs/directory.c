#include <string.h>
#include <stdlib.h>
#include "kernel/filesystem.h"

directory_t *alloc_directorie(const char *name)
{
    directory_t *dir = MALLOC(directory_t);

    dir->name[0] = '\0';
    strncpy((char *)&dir->name, name, PATH_FILE_NAME_SIZE);
    dir->directories = sll_new();
    dir->files = sll_new();

    return dir;
}

/* --- Create/Delete/Existe ------------------------------------------------- */

int directory_create(directory_t *relative, const char *path, int flags)
{
}

int directory_delete(directory_t *relative, const char *path, bool recursive)
{
}

int directory_existe(directory_t *relative, const char *path)
{
}

/* --- Move/Copy ------------------------------------------------------------ */

int directory_copy(directory_t *relative_s, const char *source, directory_t *relative_d, const char *destination)
{
}

int directory_move(directory_t *relative_s, const char *source, directory_t *relative_d, const char *destination)
{
}

/* --- Open/Close/Read/Write ------------------------------------------------ */

directory_t *directory_open(directory_t *relative, const char *path)
{
}

void directory_close(directory_t *directory)
{
}

int directory_get_files(directory_t *directory, char *name, int index)
{
}

int directory_get_directories(directory_t *directory, char *name, int index)
{
}
