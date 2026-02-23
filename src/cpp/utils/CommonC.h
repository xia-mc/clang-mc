//
// Created by xia__mc on 2026/2/23.
//

#ifndef CLANG_MC_COMMONC_H
#define CLANG_MC_COMMONC_H

// compiler feature abstraction

#if defined(_MSC_VER)

#  define LIKELY(x)   (x)
#  define UNLIKELY(x) (x)
#  define UNREACHABLE() __assume(0)
#  define NOINLINE __declspec(noinline)
#  define NORETURN __declspec(noreturn)
#  define FORCEINLINE __forceinline

#elif defined(__clang__) || defined(__GNUC__)

#  define LIKELY(x)   __builtin_expect(!!(x), 1)
#  define UNLIKELY(x) __builtin_expect(!!(x), 0)
#  define UNREACHABLE() __builtin_unreachable()
#  define NOINLINE __attribute__((noinline))
#  define NORETURN __attribute__((noreturn))
#  define FORCEINLINE __attribute__((always_inline)) inline

#else  // fallback

#  define LIKELY(x)   (x)
#  define UNLIKELY(x) (x)
#  define UNREACHABLE() ((void)0)
#  define NOINLINE
#  define NORETURN
#  define FORCEINLINE inline

#endif


// some helper
#define _STR_HELPER(x) #x
#define STR(x) _STR_HELPER(x)

#endif //CLANG_MC_COMMONC_H
