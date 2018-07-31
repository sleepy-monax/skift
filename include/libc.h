#pragma once

#include "types.h"
#include "stdarg.h"

void exit(int errcode);

u32 stoi(string str, u8 base);
void itos(u32 value, string buffer, u8 base);
