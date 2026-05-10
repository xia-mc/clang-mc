#include <stdio.h>

int main(void) {
    char buf[64];
    int n;

    n = snprintf(buf, sizeof(buf), "%.4g", 12345.0);
    if (n != 9)
        return 100 + n;
    if (buf[0] != '1')
        return 110;
    if (buf[1] != '.')
        return 111;
    if (buf[2] != '2')
        return 112;
    if (buf[3] != '3')
        return 113;
    if (buf[4] != '4')
        return 114;
    if (buf[5] != 'e')
        return 115;
    if (buf[6] != '+')
        return 116;
    if (buf[7] != '0')
        return 117;
    if (buf[8] != '4')
        return 118;
    if (buf[9] != '\0')
        return 119;
    return 0;
}
