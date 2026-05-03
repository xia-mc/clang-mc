#include <stdint.h>

typedef union {
    double d;
    unsigned long long u;
} d64_t;

int main(void) {
    d64_t sum;
    d64_t exact;

    sum.d = 0.1 + 0.2;
    exact.d = 0.3;

    if (!(sum.d > exact.d))
        return 101;
    if (sum.d == exact.d)
        return 102;
    if (sum.u != 0x3fd3333333333334ULL)
        return 103;
    return exact.u == 0x3fd3333333333333ULL ? 0 : 104;
}
