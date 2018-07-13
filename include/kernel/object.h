#pragma once
#include "types.h"
#include "valist.h"

typedef u32 HANDLE;

typedef struct
{
    void * classref;
    u32 refcount;
    u32 data;
} kobj_t;

typedef void (*kobj_ctor_t)(kobj_t * self);
typedef void (*kobj_free_t)(kobj_t * self);

typedef u32 (*kobj_write_t)(kobj_t * self, buffer8_t data, u32 size, u32 offset);
typedef u32 (*kobj_read_t)(kobj_t * self, buffer8_t data, u32 size, u32 offset);

typedef u32 (*kobj_open_t)(kobj_t * self);
typedef u32 (*kobj_close_t)(kobj_t * self);

typedef u32 (*kobj_fctl_t)(kobj_t * self, va_list args);

typedef struct 
{
    char name[32];
    kobj_ctor_t  ctor;
    kobj_free_t  free;

    kobj_open_t  open;
    kobj_close_t close;
    
    kobj_write_t write;
    kobj_read_t  read;
    
    kobj_fctl_t  fctl;
} kobj_class_t;

kobj_class_t* kobj_alloc_class(string name, kobj_ctor_t ctor, kobj_free_t free, kobj_close_t close, kobj_open_t  open, kobj_write_t write, kobj_read_t read, kobj_fctl_t fctl);
void kobj_remove_class(kobj_class_t* kobj_class);

HANDLE kobj_alloc(string classname);
void kobj_free(HANDLE handle, string classname);

u32 kobj_write(HANDLE handle, buffer8_t data, u32 size, u32 offset);
u32 kobj_read(HANDLE handle, buffer8_t data, u32 size, u32 offset);

HANDLE kobj_open(string path);
u32 kobj_close(HANDLE handle);

u32 kobj_fctl(HANDLE handle, va_list args);