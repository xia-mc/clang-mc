#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <stdlib.h>

static int
digit_value(int c)
{
    if (c >= '0' && c <= '9')
        return c - '0';
    if (c >= 'A' && c <= 'Z')
        return c - 'A' + 10;
    if (c >= 'a' && c <= 'z')
        return c - 'a' + 10;
    return 36;
}

long long
strtoll(const char *restrict nptr, char **restrict endptr, int base)
{
    const unsigned char *s = (const unsigned char *)nptr;
    unsigned long long acc = 0;
    unsigned long long limit;
    int neg = 0;
    int any = 0;

    if (base < 0 || base == 1 || base > 36) {
        errno = EINVAL;
        if (endptr)
            *endptr = (char *)nptr;
        return 0;
    }

    while (isspace(*s))
        ++s;

    if (*s == '-' || *s == '+')
        neg = *s++ == '-';

    if ((base == 0 || base == 16) && s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) {
        base = 16;
        s += 2;
    } else if (base == 0) {
        base = (*s == '0') ? 8 : 10;
    }

    limit = neg ? (unsigned long long)LLONG_MAX + 1ULL : (unsigned long long)LLONG_MAX;
    for (;;) {
        int d = digit_value(*s);
        if (d >= base)
            break;
        any = 1;
        if (acc > (limit - (unsigned long long)d) / (unsigned long long)base) {
            errno = ERANGE;
            acc = limit;
            while (digit_value(*++s) < base) {
            }
            break;
        }
        acc = acc * (unsigned long long)base + (unsigned long long)d;
        ++s;
    }

    if (endptr)
        *endptr = (char *)(any ? (const char *)s : nptr);

    if (neg) {
        if (acc == (unsigned long long)LLONG_MAX + 1ULL)
            return LLONG_MIN;
        return -(long long)acc;
    }
    return (long long)acc;
}
