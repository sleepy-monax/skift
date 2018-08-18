#include <string.h>

#include "kernel/filesystem.h"
#include "kernel/multiboot.h"
#include "lib/tar.h"
#include "kernel/logging.h"

void ramdisk_load(multiboot_module_t *module)
{
    tar_block_t block;

    for(size_t i = 0; tar_read((void*)module->mod_start, &block, i); i++)
    {
        if (block.name[strlen(block.name) - 1] == '/')
        {
            //info("folder: %s at 0x%x.", block.name, block.data);
            directory_create(NULL, block.name, 0);
        }
        else
        {
            //info("file: %s at 0x%x.", block.name, block.data);
            file_create(NULL, block.name, 0);
        }
    }

    //fs_dump(root);
}