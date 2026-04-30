#ifndef _LIBC_WCHAR_H_
#define _LIBC_WCHAR_H_

#include <stddef.h>
#include <stdint.h>
#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef int wint_t;
typedef struct {
    unsigned int __state;
} mbstate_t;

#ifndef WEOF
#define WEOF ((wint_t)-1)
#endif

wint_t btowc(int c);
int wctob(wint_t c);
int mbsinit(const mbstate_t *ps);
size_t mbrlen(const char *restrict s, size_t n, mbstate_t *restrict ps);
size_t mbrtowc(wchar_t *restrict pwc, const char *restrict s, size_t n, mbstate_t *restrict ps);
size_t wcrtomb(char *restrict s, wchar_t wc, mbstate_t *restrict ps);
size_t mbstowcs(wchar_t *restrict dst, const char *restrict src, size_t len);
size_t wcstombs(char *restrict dst, const wchar_t *restrict src, size_t len);

size_t wcslen(const wchar_t *s);
wchar_t *wcscpy(wchar_t *restrict dst, const wchar_t *restrict src);
wchar_t *wcsncpy(wchar_t *restrict dst, const wchar_t *restrict src, size_t n);
wchar_t *wcscat(wchar_t *restrict dst, const wchar_t *restrict src);
wchar_t *wcsncat(wchar_t *restrict dst, const wchar_t *restrict src, size_t n);
int wcscmp(const wchar_t *s1, const wchar_t *s2);
int wcsncmp(const wchar_t *s1, const wchar_t *s2, size_t n);
wchar_t *wcschr(const wchar_t *s, wchar_t c);
wchar_t *wcsrchr(const wchar_t *s, wchar_t c);
wchar_t *wcsstr(const wchar_t *haystack, const wchar_t *needle);
wchar_t *wcspbrk(const wchar_t *s, const wchar_t *accept);
size_t wcsspn(const wchar_t *s, const wchar_t *accept);
size_t wcscspn(const wchar_t *s, const wchar_t *reject);

#ifdef __cplusplus
}
#endif

#endif
