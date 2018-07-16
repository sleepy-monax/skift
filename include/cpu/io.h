#pragma once
#include "types.h"

u8   inb (u16 port);
void outb(u16 port, u8 data);
u16  inw (u16 port);
void outw(u16 port, u16 data);