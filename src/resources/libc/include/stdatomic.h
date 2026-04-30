#ifndef _LIBC_STDATOMIC_H_
#define _LIBC_STDATOMIC_H_

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define __CLANG_MC_ATOMIC_LOCK_FREE_4 2

#define ATOMIC_BOOL_LOCK_FREE 2
#define ATOMIC_CHAR_LOCK_FREE 2
#define ATOMIC_CHAR16_T_LOCK_FREE 2
#define ATOMIC_CHAR32_T_LOCK_FREE 2
#define ATOMIC_WCHAR_T_LOCK_FREE 2
#define ATOMIC_SHORT_LOCK_FREE 2
#define ATOMIC_INT_LOCK_FREE 2
#define ATOMIC_LONG_LOCK_FREE 2
#define ATOMIC_LLONG_LOCK_FREE 1
#define ATOMIC_POINTER_LOCK_FREE 2

typedef enum {
    memory_order_relaxed = __ATOMIC_RELAXED,
    memory_order_consume = __ATOMIC_CONSUME,
    memory_order_acquire = __ATOMIC_ACQUIRE,
    memory_order_release = __ATOMIC_RELEASE,
    memory_order_acq_rel = __ATOMIC_ACQ_REL,
    memory_order_seq_cst = __ATOMIC_SEQ_CST
} memory_order;

#define atomic_bool _Atomic bool
#define atomic_char _Atomic char
#define atomic_schar _Atomic signed char
#define atomic_uchar _Atomic unsigned char
#define atomic_short _Atomic short
#define atomic_ushort _Atomic unsigned short
#define atomic_int _Atomic int
#define atomic_uint _Atomic unsigned int
#define atomic_long _Atomic long
#define atomic_ulong _Atomic unsigned long
#define atomic_llong _Atomic long long
#define atomic_ullong _Atomic unsigned long long
#define atomic_char16_t _Atomic uint_least16_t
#define atomic_char32_t _Atomic uint_least32_t
#define atomic_wchar_t _Atomic __WCHAR_TYPE__
#define atomic_intptr_t _Atomic intptr_t
#define atomic_uintptr_t _Atomic uintptr_t
#define atomic_size_t _Atomic size_t
#define atomic_ptrdiff_t _Atomic ptrdiff_t
#define atomic_intmax_t _Atomic intmax_t
#define atomic_uintmax_t _Atomic uintmax_t

#define ATOMIC_VAR_INIT(value) (value)
#define atomic_init(obj, value) (*(obj) = (value))

#define kill_dependency(y) (y)

#define atomic_thread_fence(order) ((void)(order))
#define atomic_signal_fence(order) ((void)(order))
#define atomic_is_lock_free(obj) (sizeof(*(obj)) <= 4)

#define atomic_store(object, desired) ((void)(*(object) = (desired)))
#define atomic_store_explicit(object, desired, order) ((void)(order), atomic_store((object), (desired)))
#define atomic_load(object) (*(object))
#define atomic_load_explicit(object, order) ((void)(order), atomic_load(object))
#define atomic_exchange(object, desired) \
    __extension__ ({ __typeof__(*(object)) __old = *(object); *(object) = (desired); __old; })
#define atomic_exchange_explicit(object, desired, order) ((void)(order), atomic_exchange((object), (desired)))
#define atomic_compare_exchange_strong(object, expected, desired) \
    __extension__ ({ int __ok = (*(object) == *(expected)); if (__ok) *(object) = (desired); else *(expected) = *(object); __ok; })
#define atomic_compare_exchange_strong_explicit(object, expected, desired, success, failure) \
    ((void)(success), (void)(failure), atomic_compare_exchange_strong((object), (expected), (desired)))
#define atomic_compare_exchange_weak(object, expected, desired) \
    atomic_compare_exchange_strong((object), (expected), (desired))
#define atomic_compare_exchange_weak_explicit(object, expected, desired, success, failure) \
    atomic_compare_exchange_strong_explicit((object), (expected), (desired), (success), (failure))

#define atomic_fetch_add(object, operand) \
    __extension__ ({ __typeof__(*(object)) __old = *(object); *(object) = __old + (operand); __old; })
#define atomic_fetch_add_explicit(object, operand, order) ((void)(order), atomic_fetch_add((object), (operand)))
#define atomic_fetch_sub(object, operand) \
    __extension__ ({ __typeof__(*(object)) __old = *(object); *(object) = __old - (operand); __old; })
#define atomic_fetch_sub_explicit(object, operand, order) ((void)(order), atomic_fetch_sub((object), (operand)))
#define atomic_fetch_or(object, operand) \
    __extension__ ({ __typeof__(*(object)) __old = *(object); *(object) = __old | (operand); __old; })
#define atomic_fetch_or_explicit(object, operand, order) ((void)(order), atomic_fetch_or((object), (operand)))
#define atomic_fetch_xor(object, operand) \
    __extension__ ({ __typeof__(*(object)) __old = *(object); *(object) = __old ^ (operand); __old; })
#define atomic_fetch_xor_explicit(object, operand, order) ((void)(order), atomic_fetch_xor((object), (operand)))
#define atomic_fetch_and(object, operand) \
    __extension__ ({ __typeof__(*(object)) __old = *(object); *(object) = __old & (operand); __old; })
#define atomic_fetch_and_explicit(object, operand, order) ((void)(order), atomic_fetch_and((object), (operand)))

typedef atomic_bool atomic_flag;
#define ATOMIC_FLAG_INIT false
#define atomic_flag_test_and_set(object) atomic_exchange((object), true)
#define atomic_flag_test_and_set_explicit(object, order) atomic_exchange_explicit((object), true, (order))
#define atomic_flag_clear(object) atomic_store((object), false)
#define atomic_flag_clear_explicit(object, order) atomic_store_explicit((object), false, (order))

#endif
