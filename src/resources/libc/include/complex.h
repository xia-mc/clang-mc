#ifndef _LIBC_COMPLEX_H_
#define _LIBC_COMPLEX_H_

#define complex _Complex
#define _Complex_I (__extension__ 1.0iF)
#define I _Complex_I

#ifdef __cplusplus
extern "C" {
#endif

double cabs(double complex z);
float cabsf(float complex z);
long double cabsl(long double complex z);
double creal(double complex z);
float crealf(float complex z);
long double creall(long double complex z);
double cimag(double complex z);
float cimagf(float complex z);
long double cimagl(long double complex z);
double complex conj(double complex z);
float complex conjf(float complex z);
long double complex conjl(long double complex z);

#ifdef __cplusplus
}
#endif

#endif
