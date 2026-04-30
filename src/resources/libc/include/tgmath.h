#ifndef _LIBC_TGMATH_H_
#define _LIBC_TGMATH_H_

#include <math.h>
#include <complex.h>

#define fabs(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), fabsf(x), fabs(x))
#define sqrt(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), sqrtf(x), sqrt(x))
#define sin(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), sinf(x), sin(x))
#define cos(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), cosf(x), cos(x))
#define tan(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), tanf(x), tan(x))
#define exp(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), expf(x), exp(x))
#define log(x) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__(x), float), logf(x), log(x))
#define pow(x, y) __builtin_choose_expr(__builtin_types_compatible_p(__typeof__((x) + (y)), float), powf((x), (y)), pow((x), (y)))

#endif
