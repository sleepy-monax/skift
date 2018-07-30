#include "drawing.h"
#include "stdlib.h"

bitmap_t * bitmap_alloc(u32 width, u32 height)
{
    bitmap_t * bitmap = malloc(sizeof(bitmap_t));
    
    bitmap->buffer = malloc(width * height * sizeof(int));
    bitmap->width = width;
    bitmap->height = height;
 
    return bitmap;
}

void bitmap_free(bitmap_t * bitmap)
{
    free(bitmap->buffer);
    free(bitmap);
}