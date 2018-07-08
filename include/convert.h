#pragma once

#include "types.h"

u32 string_to_uint(string str, u8 base);
void uint_to_string(u32 value, string buffer, u8 base);