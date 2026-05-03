#include <math.h>
#include <stdio.h>
#include <string.h>

int main(void) {
    char buf[64];

    if (snprintf(buf, sizeof(buf), "%.2f", 1.25) != 4)
        return 101;
    if (strcmp(buf, "1.25") != 0)
        return 102;

    if (snprintf(buf, sizeof(buf), "%.2E", 12.5) != 8)
        return 103;
    if (strcmp(buf, "1.25E+01") != 0)
        return 104;

    if (snprintf(buf, sizeof(buf), "%.4g", 12345.0) != 9)
        return 105;
    if (strcmp(buf, "1.234e+04") != 0)
        return 106;

    if (snprintf(buf, sizeof(buf), "%F", -INFINITY) != 4)
        return 107;
    return strcmp(buf, "-INF") == 0 ? 0 : 108;
}
