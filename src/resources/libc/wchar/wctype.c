#include <ctype.h>
#include <string.h>
#include <wctype.h>

enum {
    WC_ALNUM = 1,
    WC_ALPHA,
    WC_BLANK,
    WC_CNTRL,
    WC_DIGIT,
    WC_GRAPH,
    WC_LOWER,
    WC_PRINT,
    WC_PUNCT,
    WC_SPACE,
    WC_UPPER,
    WC_XDIGIT,
};

static int
ascii_wint(wint_t wc)
{
    return wc >= 0 && wc <= 0x7f;
}

int iswalnum(wint_t wc) { return ascii_wint(wc) && isalnum((int)wc); }
int iswalpha(wint_t wc) { return ascii_wint(wc) && isalpha((int)wc); }
int iswblank(wint_t wc) { return ascii_wint(wc) && isblank((int)wc); }
int iswcntrl(wint_t wc) { return ascii_wint(wc) && iscntrl((int)wc); }
int iswdigit(wint_t wc) { return ascii_wint(wc) && isdigit((int)wc); }
int iswgraph(wint_t wc) { return ascii_wint(wc) && isgraph((int)wc); }
int iswlower(wint_t wc) { return ascii_wint(wc) && islower((int)wc); }
int iswprint(wint_t wc) { return ascii_wint(wc) && isprint((int)wc); }
int iswpunct(wint_t wc) { return ascii_wint(wc) && ispunct((int)wc); }
int iswspace(wint_t wc) { return ascii_wint(wc) && isspace((int)wc); }
int iswupper(wint_t wc) { return ascii_wint(wc) && isupper((int)wc); }
int iswxdigit(wint_t wc) { return ascii_wint(wc) && isxdigit((int)wc); }
wint_t towlower(wint_t wc) { return ascii_wint(wc) ? tolower((int)wc) : wc; }
wint_t towupper(wint_t wc) { return ascii_wint(wc) ? toupper((int)wc) : wc; }

wctype_t
wctype(const char *property)
{
    if (strcmp(property, "alnum") == 0) return WC_ALNUM;
    if (strcmp(property, "alpha") == 0) return WC_ALPHA;
    if (strcmp(property, "blank") == 0) return WC_BLANK;
    if (strcmp(property, "cntrl") == 0) return WC_CNTRL;
    if (strcmp(property, "digit") == 0) return WC_DIGIT;
    if (strcmp(property, "graph") == 0) return WC_GRAPH;
    if (strcmp(property, "lower") == 0) return WC_LOWER;
    if (strcmp(property, "print") == 0) return WC_PRINT;
    if (strcmp(property, "punct") == 0) return WC_PUNCT;
    if (strcmp(property, "space") == 0) return WC_SPACE;
    if (strcmp(property, "upper") == 0) return WC_UPPER;
    if (strcmp(property, "xdigit") == 0) return WC_XDIGIT;
    return 0;
}

int
iswctype(wint_t wc, wctype_t desc)
{
    switch (desc) {
    case WC_ALNUM: return iswalnum(wc);
    case WC_ALPHA: return iswalpha(wc);
    case WC_BLANK: return iswblank(wc);
    case WC_CNTRL: return iswcntrl(wc);
    case WC_DIGIT: return iswdigit(wc);
    case WC_GRAPH: return iswgraph(wc);
    case WC_LOWER: return iswlower(wc);
    case WC_PRINT: return iswprint(wc);
    case WC_PUNCT: return iswpunct(wc);
    case WC_SPACE: return iswspace(wc);
    case WC_UPPER: return iswupper(wc);
    case WC_XDIGIT: return iswxdigit(wc);
    default: return 0;
    }
}

wctrans_t
wctrans(const char *property)
{
    if (strcmp(property, "tolower") == 0) return 1;
    if (strcmp(property, "toupper") == 0) return 2;
    return 0;
}

wint_t
towctrans(wint_t wc, wctrans_t desc)
{
    if (desc == 1)
        return towlower(wc);
    if (desc == 2)
        return towupper(wc);
    return wc;
}
