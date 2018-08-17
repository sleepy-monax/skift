
#include <stdio.h>
#include <string.h>

void append(char* s, char c)
{
        int len = strlen(s);
        s[len] = c;
        s[len+1] = '\0';
}



void path_test(const char * path)
{
    char buffer[128];
    
    printf("%s\n", path);
    
    for (int i = 0; read_path(path, i, buffer); i++) 
    {
        printf("%s, ", buffer);
    }
    
    printf("\nDONE\n\n");
}

int main()
{
    path_test("user/document/project/skift");
    path_test("/user/document/project/skift");
    path_test("user/document/project/skift/");
    path_test("/user/document/project/skift/");
    
    return 0;
}