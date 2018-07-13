#include "kernel/system.h"
#include "kernel/device.h"
#include "device/ide.h"

void device_setup()
{
    setup(ide);
}