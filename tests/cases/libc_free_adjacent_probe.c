#include <stdlib.h>

int main(void) {
    void *a;
    void *b;

    __asm volatile ("inline data modify storage std:vm trace set value \"a\"");
    a = malloc(28);
    b = malloc(28);
    __asm volatile ("inline data modify storage std:vm trace set value \"b\"");
    if (a == 0 || b == 0)
        return 100;

    free(b);
    __asm volatile ("inline data modify storage std:vm trace set value \"c\"");
    free(a);
    __asm volatile ("inline data modify storage std:vm trace set value \"d\"");
    return 0;
}
