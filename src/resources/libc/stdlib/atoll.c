#include <stdlib.h>

long long
atoll(const char *s)
{
    return strtoll(s, 0, 10);
}
