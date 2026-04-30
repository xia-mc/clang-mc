#include <stdlib.h>

void
abort(void)
{
    __asm__("inline tellraw @a \"[DataPack] Aborted! Program has crashed, run /reload to reset.\"");
    for (;;) {
    }
}

int
atexit(void (*func)(void))
{
    (void)func;
    return 0;
}
