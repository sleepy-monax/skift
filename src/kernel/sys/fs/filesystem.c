#include "kernel/filesystem.h"
#include "stdlib.h"
#include "string.h"

fs_node_t * root;

fs_node_t * fs_findir(fs_node_t * node, string name)
{
    if (!node || node->type != NODE_DIR) return NULL;

    directory_entry_t * entry = (directory_entry_t*)node->data;
    
    for(size_t i = 0; i < node->size; i++)
    {
        if (strcmp(name, entry->name))
        {
            return entry->node;
        }

        entry = entry->next;
    }
    
    return NULL;
}

fs_node_t * get_fs_node(string path)
{
    if (path[0] != PATH_SEPARATOR)
    {
        return NULL;
    }

    char current_name[MAX_FILE_NAME_SIZE];
         current_name[0] = '\0';

    fs_node_t * current_node = root;

    for (size_t i = 1; path[i]; i++)
    {
        char c = path[i];

        if (c == PATH_SEPARATOR)
        {
            current_node = fs_findir(current_node, current_name);
            
            if (current_node)
            {
                current_name[0] = '\0';
            }
            else
            {
                return NULL;
            }
        }
        else
        {
            strapd(current_name, c);
        }
    }  

    return current_node;
}

fs_node_t * new_node(node_type_t type, open_t open, close_t close, read_t read, write_t write, ioctl_t ioctl)
{
    fs_node_t * node = (fs_node_t *)malloc(sizeof(fs_node_t));
    
    node->type = type;

    node->open = open;
    node->close = close;
    node->read = read;
    node->write = write;
    node->ioctl = ioctl;
    
    node->size = 0;
    node->data = NULL;

    return node;
}

/* --- Public functions ----------------------------------------------------- */

void fs_setup()
{
    
}

fs_node_t * fs_open(string path, u8 flags)
{
    UNUSED(flags);
    fs_node_t * node = get_fs_node(path);

    if (node->open(node))
    {
        node->refcount++;
        return node;
    }

    return NULL;
}

s32 fs_close(fs_node_t * node)
{
    node->close(node);
    node->refcount--;
    return 0;
}

s32 fs_read(fs_node_t * node, void * buffer, size_t size)
{
    if (node->read)
    {
        return node->read(node, buffer, size);
    }

    return -1;
}

s32 fs_write(fs_node_t * node, void * buffer, size_t size)
{
    if (node->write)
    {
        return node->write(node, buffer, size);
    }

    return -1;
}

s32 fs_ioctl(fs_node_t * node, u32 request, void * argp)
{
    if (node->ioctl)
    {
        return node->ioctl(node, request, argp);
    }

    return -1;
}
