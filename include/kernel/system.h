#pragma once

#include "types.h"

/* --- Console and logging -------------------------------------------------- */

void install_console();

void kprint();
void kprintf();

void __assert(string file, int line ,bool sucess, string assert);
void __log(u8 level, string function, string message, ...);
void __dump_register(registry_t * reg);
void __panic(string file,  string function,  int line, string message, ...);

/* --- Clock ---------------------------------------------------------------- */

void install_clock();

void clock_read();
void clock_readv();

/* --- File system ---------------------------------------------------------- */

void install_filesystem();

void file_open();
void file_close();
void file_write();
void file_read();

void file_delete();
void file_copy();
void file_move();

void directory_create();
void directory_delete();
void directory_copy();
void directory_move();

/* --- Tasking -------------------------------------------------------------- */

void install_tasking();

void task_id();
void task_create();
void task_stop();
void task_sleep();