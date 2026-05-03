#ifndef _LIBC_STDINT_H_
#define _LIBC_STDINT_H_

typedef __INT8_TYPE__ int8_t;
typedef __INT16_TYPE__ int16_t;
typedef __INT32_TYPE__ int32_t;
typedef __INT64_TYPE__ int64_t;

typedef __UINT8_TYPE__ uint8_t;
typedef __UINT16_TYPE__ uint16_t;
typedef __UINT32_TYPE__ uint32_t;
typedef __UINT64_TYPE__ uint64_t;

typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;
typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;

typedef int32_t int_fast8_t;
typedef int32_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef int64_t int_fast64_t;
typedef uint32_t uint_fast8_t;
typedef uint32_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
typedef uint64_t uint_fast64_t;

typedef __INTPTR_TYPE__ intptr_t;
typedef __UINTPTR_TYPE__ uintptr_t;
typedef __INTMAX_TYPE__ intmax_t;
typedef __UINTMAX_TYPE__ uintmax_t;

#define _LIBC_INT_C(value, suffix) value ## suffix
#define _LIBC_INT_C2(value, suffix) _LIBC_INT_C(value, suffix)

#define INT8_MIN (-__INT8_MAX__ - 1)
#define INT16_MIN (-__INT16_MAX__ - 1)
#define INT32_MIN (-__INT32_MAX__ - 1)
#define INT64_MIN (-__INT64_MAX__ - 1)
#define INT8_MAX __INT8_MAX__
#define INT16_MAX __INT16_MAX__
#define INT32_MAX __INT32_MAX__
#define INT64_MAX __INT64_MAX__

#define UINT8_MAX __UINT8_MAX__
#define UINT16_MAX __UINT16_MAX__
#define UINT32_MAX __UINT32_MAX__
#define UINT64_MAX __UINT64_MAX__

#define INT_LEAST8_MIN INT8_MIN
#define INT_LEAST16_MIN INT16_MIN
#define INT_LEAST32_MIN INT32_MIN
#define INT_LEAST64_MIN INT64_MIN
#define INT_LEAST8_MAX INT8_MAX
#define INT_LEAST16_MAX INT16_MAX
#define INT_LEAST32_MAX INT32_MAX
#define INT_LEAST64_MAX INT64_MAX

#define UINT_LEAST8_MAX UINT8_MAX
#define UINT_LEAST16_MAX UINT16_MAX
#define UINT_LEAST32_MAX UINT32_MAX
#define UINT_LEAST64_MAX UINT64_MAX

#define INT_FAST8_MIN INT32_MIN
#define INT_FAST16_MIN INT32_MIN
#define INT_FAST32_MIN INT32_MIN
#define INT_FAST64_MIN INT64_MIN
#define INT_FAST8_MAX INT32_MAX
#define INT_FAST16_MAX INT32_MAX
#define INT_FAST32_MAX INT32_MAX
#define INT_FAST64_MAX INT64_MAX

#define UINT_FAST8_MAX UINT32_MAX
#define UINT_FAST16_MAX UINT32_MAX
#define UINT_FAST32_MAX UINT32_MAX
#define UINT_FAST64_MAX UINT64_MAX

#define INTPTR_MIN (-__INTPTR_MAX__ - 1)
#define INTPTR_MAX __INTPTR_MAX__
#define UINTPTR_MAX __UINTPTR_MAX__

#define INTMAX_MIN (-__INTMAX_MAX__ - 1)
#define INTMAX_MAX __INTMAX_MAX__
#define UINTMAX_MAX __UINTMAX_MAX__

#define PTRDIFF_MIN (-__PTRDIFF_MAX__ - 1)
#define PTRDIFF_MAX __PTRDIFF_MAX__

#define SIG_ATOMIC_MIN (-__SIG_ATOMIC_MAX__ - 1)
#define SIG_ATOMIC_MAX __SIG_ATOMIC_MAX__

#ifdef __WCHAR_UNSIGNED__
#define WCHAR_MIN 0
#else
#define WCHAR_MIN (-__WCHAR_MAX__ - 1)
#endif
#define WCHAR_MAX __WCHAR_MAX__

#ifdef __WINT_UNSIGNED__
#define WINT_MIN 0
#else
#define WINT_MIN (-__WINT_MAX__ - 1)
#endif
#define WINT_MAX __WINT_MAX__

#ifndef SIZE_MAX
#define SIZE_MAX __SIZE_MAX__
#endif

#define INT8_C(value) _LIBC_INT_C2(value, __INT8_C_SUFFIX__)
#define INT16_C(value) _LIBC_INT_C2(value, __INT16_C_SUFFIX__)
#define INT32_C(value) _LIBC_INT_C2(value, __INT32_C_SUFFIX__)
#define INT64_C(value) _LIBC_INT_C2(value, __INT64_C_SUFFIX__)

#define UINT8_C(value) _LIBC_INT_C2(value, __UINT8_C_SUFFIX__)
#define UINT16_C(value) _LIBC_INT_C2(value, __UINT16_C_SUFFIX__)
#define UINT32_C(value) _LIBC_INT_C2(value, __UINT32_C_SUFFIX__)
#define UINT64_C(value) _LIBC_INT_C2(value, __UINT64_C_SUFFIX__)

#define INTMAX_C(value) _LIBC_INT_C2(value, __INTMAX_C_SUFFIX__)
#define UINTMAX_C(value) _LIBC_INT_C2(value, __UINTMAX_C_SUFFIX__)

#endif
