#include "drawing.h"
#include "stdlib.h"
#include "math.h"

u32 hsv2rgb(float h, float s, float v)
{
	float c  = v * s;
	float hp = (float)h / 42.6666666f;
	float x = c * (1.0 - fabs(fmod(hp, 2) - 1.0));
	float m = v - c;
	float rp, gp, bp;
	if (hp < 1.0)      { rp = c; gp = x; bp = 0; }
	else if (hp < 2.0) { rp = x; gp = c; bp = 0; }
	else if (hp < 3.0) { rp = 0; gp = c; bp = x; }
	else if (hp < 4.0) { rp = 0; gp = x; bp = c; }
	else if (hp < 5.0) { rp = x; gp = 0; bp = c; }
	else if (hp < 6.0) { rp = c; gp = 0; bp = x; }
	else               { rp = 0; gp = 0; bp = 0; }
	return rgb((rp + m) * 255, (gp + m) * 255, (bp + m) * 255);
}

u32 rgb(u8 r, u8 g, u8 b)
{
	return 0xff000000 | (r << 16) | (g << 8) | b;
}

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
