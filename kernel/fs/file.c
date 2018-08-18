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
