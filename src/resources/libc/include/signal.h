#ifndef _LIBC_SIGNAL_H_
#define _LIBC_SIGNAL_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef int sig_atomic_t;
typedef void (*__sighandler_t)(int);

#define SIG_DFL ((__sighandler_t)0)
#define SIG_IGN ((__sighandler_t)1)
#define SIG_ERR ((__sighandler_t)-1)

#define SIGABRT 1
#define SIGFPE 2
#define SIGILL 3
#define SIGINT 4
#define SIGSEGV 5
#define SIGTERM 6

__sighandler_t signal(int sig, __sighandler_t func);
int raise(int sig);

#ifdef __cplusplus
}
#endif

#endif
