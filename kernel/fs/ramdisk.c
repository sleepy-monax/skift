#include <stdio.h>
#include "utils.h"
#include "types.h"
#include "lib/tar.h"
#include "kernel/logging.h"

void load_ramdisk(void *addr)
{
    tar_block_t block;
    
    for(size_t i = 0; tar_read(addr, &block, i); i++)
    {
        info("file: %s at %x.", block.name, block.data);
    }    
}