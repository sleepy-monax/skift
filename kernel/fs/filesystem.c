#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "kernel/filesystem.h"

directory_t * root;

void fs_init()
{

}

directory_t * fs_get_dir(string path)
{
    char buffer[min(strlen(path) + 1, MAX_PATH_SIZE)];
    strncpy(buffer, path, MAX_PATH_SIZE);
    char current[MAX_NAME_SIZE];
    memset(current, 0, MAX_PATH_SIZE);

    for(size_t i = 0; buffer[i]; i++)
    {
        if (buffer[i] == FS_PATH_SEPARATOR)
        {

        }
        else
        {
            strapd(current, buffer[i]);
        }
    }
    
    return NULL;
}

file_t * fs_get_file(string path)
{
    UNUSED(path);
    return NULL;
}