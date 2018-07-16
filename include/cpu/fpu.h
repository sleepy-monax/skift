#pragma once
#include "types.h"

void fpu_setup();
void fpu_save(buffer8_t state);
void fpu_load(buffer8_t state);