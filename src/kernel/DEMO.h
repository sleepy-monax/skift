#include "drawing.h"
#include "device/bga.h"
#include "math.h"

void demo_mandelbrot()
{
    bga_mode(800, 600);
    int height = 600;
    int width = 800;
    int max = 128;
    double i = 1.0;

    u32 colors[128];

    for(size_t i = 0; i < 128; i++)
    {
        colors[i] = hsv2rgb(i * 2, 1, 1);
    }
    
    while (true)
    {
        
        for (int col = 0; col < width; col++) 
        {
            for (int row = 0; row < height; row++) 
            {
                double c_re = (col - width/2.0)*4.0/width / i - 1.5;
                double c_im = (row - height/2.0)*4.0/width / i;
                double x = 0, y = 0;
                int iteration = 0;
                while (x*x+y*y <= 4 && iteration < max) {
                    double x_new = x*x - y*y + c_re;
                    y = 2*x*y + c_im;
                    x = x_new;
                    iteration++;
                }
                if (iteration < max) bga_pixel(col, row, colors[iteration]);
                else bga_pixel(col, row, 0x0);
            }
        }

        i+= 0.01f;
        
    }
}

void demo_color()
{
    bga_mode(800, 600);

    for(double i = 0; ; i++)
    {
        for(u32 y = 0; y < 600; y++)
        {
            for(u32 x = 0; x < 800; x++)
            {
                bga_pixel(x, y, hsv2rgb(i, x / 800.0, y/600.0));
            }
        }
    }
    
    while(true);
}