#include <inttypes.h>
#include <stdlib.h>

intmax_t
imaxabs(intmax_t j)
{
    return j < 0 ? -j : j;
}

imaxdiv_t
imaxdiv(intmax_t numer, intmax_t denom)
{
    imaxdiv_t r;
    r.quot = numer / denom;
    r.rem = numer % denom;
    return r;
}

intmax_t
strtoimax(const char *restrict nptr, char **restrict endptr, int base)
{
    return strtoll(nptr, endptr, base);
}

uintmax_t
strtoumax(const char *restrict nptr, char **restrict endptr, int base)
{
    return strtoull(nptr, endptr, base);
}
