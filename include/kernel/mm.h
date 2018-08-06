#pragma once

void mm_setup();
void* mm_aquire(int process, int page_count);
void mm_giveup(int process, int page_count);