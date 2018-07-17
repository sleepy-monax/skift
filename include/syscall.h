#pragma once
#include "types.h"

int fork();
int pid();
u32 kill(u32 pid);
u32 exec(char * path);
void exit(int code);
int wait(int pid);

int brk(void * end);
void * sbrk(int increment)

int open(char * path);
void close(int fd);
size_t write(int fd, void *buffer, size_t size);
size_t read(int fd, void *buffer, size_t size); 