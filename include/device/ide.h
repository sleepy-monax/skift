#pragma once
#include "types.h"

void ide_setup();
void ide_read_block(u8 device, u32 block, u8 count, buffer16_t buffer);
void ide_write_block(u8 device, u32 block, u8 count, buffer16_t buffer);