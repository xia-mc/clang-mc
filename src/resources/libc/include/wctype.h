#ifndef _LIBC_WCTYPE_H_
#define _LIBC_WCTYPE_H_

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef int wint_t;
typedef int wctype_t;
typedef int wctrans_t;

#ifndef WEOF
#define WEOF ((wint_t)-1)
#endif

int iswalnum(wint_t wc);
int iswalpha(wint_t wc);
int iswblank(wint_t wc);
int iswcntrl(wint_t wc);
int iswdigit(wint_t wc);
int iswgraph(wint_t wc);
int iswlower(wint_t wc);
int iswprint(wint_t wc);
int iswpunct(wint_t wc);
int iswspace(wint_t wc);
int iswupper(wint_t wc);
int iswxdigit(wint_t wc);
wint_t towlower(wint_t wc);
wint_t towupper(wint_t wc);
wctype_t wctype(const char *property);
int iswctype(wint_t wc, wctype_t desc);
wctrans_t wctrans(const char *property);
wint_t towctrans(wint_t wc, wctrans_t desc);

#ifdef __cplusplus
}
#endif

#endif
