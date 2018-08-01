#include <assert.h>
#include <string.h>

void test_memchr()
{
    //char * data0 = "Lorem ipsum &olor sit amet amet.";


}

void test_memcmp()
{
    char * data0 = "Lorem ipsum dolor sit amet amet.";
    char * data1 = "Lorem ipsum dolor sit amet amet.";
    char * data2 = "Lorem ipsum ERROR sit amet amet.";

    assert(memcmp(data0, data1, 32) == 0);
    assert(memcmp(data0, data2, 32) != 0);
}

void test_memcpy()
{
    char * data = "Lorem ipsum dolor sit amet amet.";
    char dest[32];

    memcpy(dest, data, 32);
    assert(memcmp(data, dest, 32) == 0);
}

void test_memset()
{

}

void test_strcat()
{

}

void test_strncat()
{

}
