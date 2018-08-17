#include <string.h>
#include "kernel/modules.h"
#include "kernel/multiboot.h"
#include "kernel/logging.h"

void load_module(multiboot_module_t *module)
{
    info("Loading modules at %x.", module);
}

void modules_setup(multiboot_info_t *minfo)
{
    info("Bootloader: %s.", minfo->boot_loader_name);
    info("Kernel modules count: %d.", minfo->mods_count);
    info("Kernel modules adresse: %x.", minfo->mods_addr);

    
    multiboot_module_t * module = (multiboot_module_t*)minfo->mods_addr;

    for(size_t i = 0; i < minfo->mods_count; i++)
    {
        load_module(module);
        module = (multiboot_module_t *)((u32)module->mod_end + 1);
    }
}