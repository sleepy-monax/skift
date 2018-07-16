#pragma once
#include "types.h"
#include "stdarg.h"
#include "libc.h"

typedef bool (*kclass_ctor_t)(void * instance, va_list va); // constructor
typedef bool (*kclass_dtor_t)(void * instance); // destructor

void kobject_setup();
void kclass_register(const string name, kclass_ctor_t ctor, kclass_dtor_t dtor);