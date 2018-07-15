#include "kernel/system.h"
#include "kernel/kobject.h"
#include "kernel/task.h"

#define KOBJ_MAGIC 0xC1C2C3C4

typedef struct 
{
    string name;
    kclass_ctor_t ctor;
    kclass_dtor_t dtor;
} kclass_t;

typedef struct 
{
    u32 magic;
    u32 refcount;
    kclass_t * class;
    u32 data;
} kobject_t;

typedef int khandle;

list_t * kclasses;
list_t * kobjects;

lock_t kclass_list_lock;
lock_t kobj_list_lock;

void kobject_setup()
{
    lock_init(&kclass_list_lock, "class list");
    lock_init(&kobj_list_lock, "object list");

    kclasses = list_alloc();
    kobjects = list_alloc();
}

/* --- kclasses ------------------------------------------------------------- */

void kclass_register(const string name, kclass_ctor_t ctor, kclass_dtor_t dtor)
{
    info("Class '%s' registered.", name);
    kclass_t * new_class = (kclass_t*)malloc(sizeof(kclass_t));

    new_class->ctor = ctor;
    new_class->dtor = dtor;

    lock_acquire(&kclass_list_lock);
    list_append(kclasses, (u32) new_class);
    lock_release(&kclass_list_lock);
}

kclass_t * kclass_get(const string name)
{
    lock_acquire(&kclass_list_lock);

        kclass_t * result = NULL;

        for(u32 i = 0; i < kclasses->count; i++)
        {
            kclass_t * temp = (kclass_t*)list_value_at(kclasses, i);

            if (strcmp(name, temp->name) == 0)
            {
                result = temp;
                break;
            }
        }

    lock_release(&kclass_list_lock);

    return result;
}

/* --- kobjecs -------------------------------------------------------------- */

khandle kobject_new(const string baseclassname, ...)
{
    va_list va;
    va_start(va, baseclassname);

    kobject_t * instance = (kobject_t*)malloc(sizeof(kobject_t));
    instance->class = kclass_get(baseclassname);
    instance->magic = KOBJ_MAGIC;
    
    if (instance->class != NULL && (instance->class->ctor == NULL || instance->class->ctor(instance, va)))
    {
        lock_acquire(&kobj_list_lock);
        list_append(kobjects, (u32)instance);
        lock_release(&kobj_list_lock);
    }
    else
    {
        instance->magic = 0;
        free(instance);
        instance = NULL;
    }
    
    info("kobject '%s' constructed with handle %x.", baseclassname, instance);

    return (khandle)instance;
}

void kobject_free(khandle handle)
{
    kobject_t * instance = (kobject_t *)handle;

    if (instance->magic == KOBJ_MAGIC)
    {
        if (instance->class->dtor == NULL || instance->class->dtor(instance))
        {
            instance->magic = 0;
            free(instance);
        }

        warn("Trying to free a unfreeable object of class '%s'.", instance->class->name);
    }
    else
    {
        warn("Invalide kobj magic (%x != %x). Are you trying to free a free object.", instance->magic, KOBJ_MAGIC);
    }
}