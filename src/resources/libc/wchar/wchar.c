#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <wchar.h>

wint_t
btowc(int c)
{
    if (c == EOF || c < 0 || c > 0x7f)
        return WEOF;
    return (wint_t)c;
}

int
wctob(wint_t c)
{
    if (c < 0 || c > 0x7f)
        return EOF;
    return (int)c;
}

int
mbsinit(const mbstate_t *ps)
{
    return ps == NULL || ps->__state == 0;
}

size_t
mbrtowc(wchar_t *restrict pwc, const char *restrict s, size_t n, mbstate_t *restrict ps)
{
    (void)ps;
    if (s == NULL)
        return 0;
    if (n == 0)
        return (size_t)-2;
    if ((unsigned char)s[0] > 0x7f) {
        errno = EILSEQ;
        return (size_t)-1;
    }
    if (pwc)
        *pwc = (wchar_t)(unsigned char)s[0];
    return s[0] == '\0' ? 0 : 1;
}

size_t
mbrlen(const char *restrict s, size_t n, mbstate_t *restrict ps)
{
    return mbrtowc(NULL, s, n, ps);
}

size_t
wcrtomb(char *restrict s, wchar_t wc, mbstate_t *restrict ps)
{
    (void)ps;
    if (s == NULL)
        return 1;
    if (wc < 0 || wc > 0x7f) {
        errno = EILSEQ;
        return (size_t)-1;
    }
    s[0] = (char)wc;
    return 1;
}

size_t
mbstowcs(wchar_t *restrict dst, const char *restrict src, size_t len)
{
    size_t i = 0;
    while (src[i] != '\0') {
        if ((unsigned char)src[i] > 0x7f) {
            errno = EILSEQ;
            return (size_t)-1;
        }
        if (dst && i < len)
            dst[i] = (wchar_t)(unsigned char)src[i];
        ++i;
        if (dst && i == len)
            return i;
    }
    if (dst && i < len)
        dst[i] = 0;
    return i;
}

size_t
wcstombs(char *restrict dst, const wchar_t *restrict src, size_t len)
{
    size_t i = 0;
    while (src[i] != 0) {
        if (src[i] < 0 || src[i] > 0x7f) {
            errno = EILSEQ;
            return (size_t)-1;
        }
        if (dst && i < len)
            dst[i] = (char)src[i];
        ++i;
        if (dst && i == len)
            return i;
    }
    if (dst && i < len)
        dst[i] = '\0';
    return i;
}

size_t
wcslen(const wchar_t *s)
{
    size_t n = 0;
    while (s[n] != 0)
        ++n;
    return n;
}

wchar_t *
wcscpy(wchar_t *restrict dst, const wchar_t *restrict src)
{
    wchar_t *d = dst;
    while ((*d++ = *src++) != 0) {
    }
    return dst;
}

wchar_t *
wcsncpy(wchar_t *restrict dst, const wchar_t *restrict src, size_t n)
{
    size_t i = 0;
    for (; i < n && src[i] != 0; ++i)
        dst[i] = src[i];
    for (; i < n; ++i)
        dst[i] = 0;
    return dst;
}

wchar_t *
wcscat(wchar_t *restrict dst, const wchar_t *restrict src)
{
    wcscpy(dst + wcslen(dst), src);
    return dst;
}

wchar_t *
wcsncat(wchar_t *restrict dst, const wchar_t *restrict src, size_t n)
{
    wchar_t *d = dst + wcslen(dst);
    size_t i = 0;
    while (i < n && src[i] != 0) {
        d[i] = src[i];
        ++i;
    }
    d[i] = 0;
    return dst;
}

int
wcscmp(const wchar_t *s1, const wchar_t *s2)
{
    while (*s1 != 0 && *s1 == *s2) {
        ++s1;
        ++s2;
    }
    return (*s1 > *s2) - (*s1 < *s2);
}

int
wcsncmp(const wchar_t *s1, const wchar_t *s2, size_t n)
{
    size_t i;
    for (i = 0; i < n; ++i) {
        if (s1[i] != s2[i] || s1[i] == 0)
            return (s1[i] > s2[i]) - (s1[i] < s2[i]);
    }
    return 0;
}

wchar_t *
wcschr(const wchar_t *s, wchar_t c)
{
    do {
        if (*s == c)
            return (wchar_t *)s;
    } while (*s++ != 0);
    return NULL;
}

wchar_t *
wcsrchr(const wchar_t *s, wchar_t c)
{
    const wchar_t *last = NULL;
    do {
        if (*s == c)
            last = s;
    } while (*s++ != 0);
    return (wchar_t *)last;
}

size_t
wcsspn(const wchar_t *s, const wchar_t *accept)
{
    size_t n = 0;
    while (s[n] != 0 && wcschr(accept, s[n]) != NULL)
        ++n;
    return n;
}

size_t
wcscspn(const wchar_t *s, const wchar_t *reject)
{
    size_t n = 0;
    while (s[n] != 0 && wcschr(reject, s[n]) == NULL)
        ++n;
    return n;
}

wchar_t *
wcspbrk(const wchar_t *s, const wchar_t *accept)
{
    while (*s != 0) {
        if (wcschr(accept, *s) != NULL)
            return (wchar_t *)s;
        ++s;
    }
    return NULL;
}

wchar_t *
wcsstr(const wchar_t *haystack, const wchar_t *needle)
{
    size_t n = wcslen(needle);
    if (n == 0)
        return (wchar_t *)haystack;
    while (*haystack != 0) {
        if (wcsncmp(haystack, needle, n) == 0)
            return (wchar_t *)haystack;
        ++haystack;
    }
    return NULL;
}
