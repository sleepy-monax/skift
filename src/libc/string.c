#include "string.h"
#include "math.h"

void * memchr(const void * str, int c, size_t n)
{
    const u8 *src = (const u8 *)str;
  
    while (n-- > 0)
    {
        if (*src == c)
            return (void*)src;
        src++;
    }

    return NULL;
}

int memcmp(const void * str1, const void * str2, size_t n)
{
    register const u8 *s1 = (const u8*)str1;
    register const u8 *s2 = (const u8*)str2;

    while (n-- > 0)
    {
        if (*s1++ != *s2++)
	    return s1[-1] < s2[-1] ? -1 : 1;
    }
    return 0;
}

void * memcpy(void * dest, const void * src, size_t n)
{
    u32 i;
    for (i = 0; i < n; i++) 
    {
        *((u8*)dest + i) = *((u8*)src + i);
    }

    return dest;
}

void * memmove(void * dest, const void * src, size_t n)
{
    return memcpy(dest, src, n);
}

void * memset(void * str, int c, size_t n)
{
    u8* temp = (u8*)str;
    for ( ; n != 0; n--) *temp++ = c;
    return str;
}

char * strcat(char * dest, const char * src)
{
    u32 i,j;
    for (i = 0; dest[i] != '\0'; i++);

    for (j = 0; src[j] != '\0'; j++)
        dest[i+j] = src[j];
    dest[i+j] = '\0';
    return dest;
}

char * strncat(char * s1, const char * s2, size_t n)
{
      char *s = s1;
    /* Find the end of S1.  */
    s1 += strlen (s1);
    size_t ss = strnlen (s2, n);
    s1[ss] = '\0';
    memcpy (s1, s2, ss);
    return s;
}

char * strchr(const char * p, int ch)
{
    char c;

	c = ch;
	for (;; ++p) {
		if (*p == c)
			return ((char *)p);
		if (*p == '\0')
			return (NULL);
	}
}


int strcmp(const char * stra, const char * strb)
{
    u32 i;

    for (i = 0; stra[i] == strb[i]; i++) {
        if (stra[i] == '\0') return 0;
    }

    return stra[i] - strb[i];
}

int strncmp(const char * s1, const char * s2, size_t n)
{
    register unsigned char u1, u2;

    while (n-- > 0)
        {
        u1 = (unsigned char) *s1++;
        u2 = (unsigned char) *s2++;
        if (u1 != u2)
        return u1 - u2;
        if (u1 == '\0')
        return 0;
        }
    return 0;
}

int strcoll(const char * s1, const char * s2)
{
    char t1[1 + strxfrm(0, s1, 0)];
    strxfrm(t1, s1, sizeof(t1));
    char t2[1 + strxfrm(0, s2, 0)];
    strxfrm(t2, s2, sizeof(t2));
    return strcmp(t1, t2);
}

char * strcpy(char * s1, const char * s2)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0)
	;
    return (s1);
}

char * strncpy(char * s1, const char * s2, size_t n)
{
    size_t size = strnlen (s2, n);
    if (size != n)
        memset (s1 + size, '\0', n - size);
    return memcpy (s1, s2, size);
}

size_t strcspn(const char * string, const char * chars)
{
    register char c, *p, *s;

    for (s = (char*)string, c = *s; c != 0; s++, c = *s) {
	for (p = (char*)chars; *p != 0; p++) {
	    if (c == *p) {
		return s-string;
	    }
	}
    }
    return s-string;
}

char * strerror(int errnum)
{
    UNUSED(errnum);
    return "Error";
}

size_t strlen(const char * str)
{
    size_t lenght = 0;
    while (str[lenght]) lenght++;
    return lenght;
}

size_t strnlen(const char *s, size_t maxlen)
{
	size_t len;

	for (len = 0; len < maxlen; len++, s++) {
		if (!*s)
			break;
	}
	return (len);
}

char * strpbrk(const char * s, const char * accept)
{
    s += strcspn (s, accept);
    return *s ? (char *)s : NULL;
}

char * strrchr(const char * s, int c)
{

    char *rtnval = 0;

    do {
        if (*s == c)
        rtnval = (char*) s;
    } while (*s++);
    return (rtnval);
}

size_t strspn(const char * p, const char * s)
{
    int i, j;

	for (i = 0; p[i]; i++) {
		for (j = 0; s[j]; j++) {
			if (s[j] == p[i])
				break;
		}
		if (!s[j])
			break;
	}
	return (i);
}

char * strstr(const char * s1, const char * s2)
{
    const char *p = s1;
    const size_t len = strlen (s2);

    for (; (p = strchr (p, *s2)) != 0; p++)
    {
        if (strncmp (p, s2, len) == 0)
        return (char *)p;
    }
    return NULL;
}

char * strtok(char * s, const char * delim)
{
    static char *lasts;
    register int ch;

    if (s == 0)
	s = lasts;
    do {
	if ((ch = *s++) == '\0')
	    return 0;
    } while (strchr(delim, ch));
    --s;
    lasts = s + strcspn(s, delim);
    if (*lasts != 0)
	*lasts++ = 0;
    return s;
}

size_t strxfrm(char * dest, const char * src, size_t n)
{
    size_t len;

    len = strlen(src);
    (void)memcpy((void *)dest, (void *)src, min(n,len + 1));

    return len;
}

void strapd(string str, char c) 
{
    u32 len = strlen(str);
    str[len] = c;
    str[len+1] = '\0';
}


void strrvs(string str) 
{
    int c, i, j;
    for (i = 0, j = strlen(str) - 1; i < j; i++, j--) 
    {
        c = str[i];
        str[i] = str[j];
        str[j] = c;
    }
}