/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <string.h>

void append(char* s, char c)
{
        int len = strlen(s);
        s[len] = c;
        s[len+1] = '\0';
}

int read_path(const char * path, int index, char * buffer)
{
    int current_index = 0;
    int current_lenght = 0;
    
    for (int i = path[0] == '/' ? 1 : 0; path[i]; i++)
    {
        char c = path[i];
        
        if (current_index == index  && c != '/')
        {
            append(buffer, c);
            current_lenght++;
        }
        
        if ( c == '/')
        {
            if (current_index == index)
            {
                return strlen(buffer) ? 1 : 0;
            }
            
            current_index++;
            buffer[0] = '\0';
        }
    }
    
    if (current_index == index)
    {
        return strlen(buffer) ? 1 : 0;
    }

    return 0;
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