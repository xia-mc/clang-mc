#include <stdlib.h>

void
abort(void)
{
    __asm__("call abort");
    for (;;) {
    }
}

int
atexit(void (*func)(void))
{
    (void)func;
    return 0;
}
