#include <signal.h>
#include <stdlib.h>

#define SIGNAL_COUNT 7

static __sighandler_t handlers[SIGNAL_COUNT];

static int
valid_signal(int sig)
{
    return sig > 0 && sig < SIGNAL_COUNT;
}

__sighandler_t
signal(int sig, __sighandler_t func)
{
    __sighandler_t old;
    if (!valid_signal(sig))
        return SIG_ERR;

    old = handlers[sig];
    handlers[sig] = func;
    return old;
}

int
raise(int sig)
{
    __sighandler_t handler;
    if (!valid_signal(sig))
        return -1;

    handler = handlers[sig];
    if (handler == SIG_IGN)
        return 0;
    if (handler == SIG_DFL) {
        if (sig == SIGABRT)
            abort();
        return 0;
    }

    handler(sig);
    return 0;
}
