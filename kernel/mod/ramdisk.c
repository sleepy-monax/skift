#include <string.h>

#include "kernel/filesystem.h"
#include "kernel/multiboot.h"
#include "lib/tar.h"
#include "kernel/logging.h"

void ramdisk_load(multiboot_module_t *module)
{
    tar_block_t block;

    info("Root folder at 0x%x.", root);

    for(size_t i = 0; tar_read((void*)module->mod_start, &block, i); i++)
    {
        if (block.name[strlen(block.name) - 1] == '/')
        {
            //info("folder: %s at 0x%x.", block.name, block.data);
            dir_create(block.name, root);
        }
        else
        {
            //info("file: %s at 0x%x.", block.name, block.data);
            file_create(block.name, root);
        }
    }

    //fs_dump(root);
}