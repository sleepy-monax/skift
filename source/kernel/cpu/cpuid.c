#include "cpu/cpuid.h"

static inline int cpuid_string(int code, int where[4]) 
{
  __asm__ volatile ("cpuid":"=a"(*where),"=b"(*(where+0)),
               "=d"(*(where+1)),"=c"(*(where+2)):"a"(code));
  return (int)where[0];
}
 
string cpuid_get_vendorid() 
{
	static char s[16] = "BogusProces!";
	cpuid_string(0, (int*)(s));
	return s;
}