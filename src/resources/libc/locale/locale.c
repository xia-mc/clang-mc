#include <locale.h>
#include <limits.h>
#include <stddef.h>
#include <string.h>

static char c_locale_name[] = "C";
static char empty[] = "";
static char decimal_point[] = ".";

static struct lconv c_locale = {
    decimal_point,
    empty,
    empty,
    empty,
    empty,
    empty,
    empty,
    empty,
    empty,
    empty,
    CHAR_MAX,
    CHAR_MAX,
    CHAR_MAX,
    CHAR_MAX,
    CHAR_MAX,
    CHAR_MAX,
    CHAR_MAX,
    CHAR_MAX,
};

char *
setlocale(int category, const char *locale)
{
    if (category < LC_ALL || category > LC_TIME)
        return NULL;

    if (locale == NULL)
        return c_locale_name;

    if (locale[0] == '\0' || strcmp(locale, "C") == 0 || strcmp(locale, "POSIX") == 0)
        return c_locale_name;

    return NULL;
}

struct lconv *
localeconv(void)
{
    return &c_locale;
}
