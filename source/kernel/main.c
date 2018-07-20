#include "cpu/cpu.h"
#include "kernel/device.h"
#include "kernel/multiboot.h"
#include "kernel/system.h"
#include "kernel/task.h"
#include "kernel/version.h"
#include "kernel/atomic.h"
#include "libc.h"
#include "types.h"

void main(multiboot_info_t * info)
{
    UNUSED(info);
    console_setup();

    info(KERNEL_UNAME);
    info("Booting...");

    setup(heap);
    setup(cpu);
    setup(system);
    atomic_enable();
    sti();

    while(true);

    panic("The end of the main function has been reached.");
}
