#include "kernel/system.h"
#include "kernel/device.h"
#include "device/atapio.h"
#include "device/bga.h"

void device_setup()
{
   setup(bga);
}