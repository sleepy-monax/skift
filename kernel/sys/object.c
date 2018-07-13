#include "libc.h"
#include "kernel/object.h"
#define MAX_KOBJ_CLASS 16
#define MAX_KOBJ 256

kobj_class_t classes[MAX_KOBJ_CLASS];
kobj_t objects[MAX_KOBJ];

/* --- Setup kobj ----------------------------------------------------------- */

void kobj_setup()
{
    memset(&classes, 0, sizeof(kobj_class_t) * MAX_KOBJ_CLASS);
    memset(&objects, 0, sizeof(kobj_t) * MAX_KOBJ);
}

/* --- K class managment ---------------------------------------------------- */

kobj_class_t* kobj_alloc_class(string name, kobj_ctor_t ctor, kobj_free_t free, kobj_close_t close, kobj_open_t  open, kobj_write_t write, kobj_read_t read, kobj_fctl_t fctl)
{
    UNUSED(name);
    UNUSED(ctor);
    UNUSED(free);
    UNUSED(close);
    UNUSED(open);
    UNUSED(write);
    UNUSED(read);
    UNUSED(fctl);

    return NULL;
}

void kobj_remove_class(kobj_class_t* kobj_class)
{
    UNUSED(kobj_class);
}

HANDLE kobj_alloc(string classname)
{
    UNUSED(classname);
    return 0;
}

void kobj_free(HANDLE handle, string classname)
{
    UNUSED(handle); UNUSED(classname);
}

u32 kobj_write(HANDLE handle, buffer8_t data, u32 size, u32 offset)
{
    UNUSED(handle);
    UNUSED(data);
    UNUSED(size);
    UNUSED(offset);
    
    return 0;
}

u32 kobj_read(HANDLE handle, buffer8_t data, u32 size, u32 offset)
{
    UNUSED(handle);
    UNUSED(data);
    UNUSED(size);
    UNUSED(offset);

    return 0;
}

HANDLE kobj_open(string path)
{
    UNUSED(path);
    return 0;
}

u32 kobj_close(HANDLE handle)
{
    UNUSED(handle);

    return 0;
}

u32 kobj_fctl(HANDLE handle, va_list args)
{
    UNUSED(handle);
    UNUSED(args);

    return 0;
}