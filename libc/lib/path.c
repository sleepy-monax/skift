#include <string.h>
#include "lib/path.h"

bool path_read(string path, uint index, string buffer)
{
    uint current_index = 0;
    buffer[0] = '\n';

    for(size_t i = 0; path[i]; i++)
    {
        char c = path[i];

        if (c == FS_PATH_SEPARATOR)
        {
            current_index++;
        }
    }
    
    return false;
}