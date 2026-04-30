#include <complex.h>
#include <math.h>

double cabs(double complex z) { return sqrt(creal(z) * creal(z) + cimag(z) * cimag(z)); }
float cabsf(float complex z) { return sqrtf(crealf(z) * crealf(z) + cimagf(z) * cimagf(z)); }
long double cabsl(long double complex z) { return sqrtl(creall(z) * creall(z) + cimagl(z) * cimagl(z)); }

double creal(double complex z) { return __real__ z; }
float crealf(float complex z) { return __real__ z; }
long double creall(long double complex z) { return __real__ z; }

double cimag(double complex z) { return __imag__ z; }
float cimagf(float complex z) { return __imag__ z; }
long double cimagl(long double complex z) { return __imag__ z; }

double complex conj(double complex z) { return creal(z) - cimag(z) * I; }
float complex conjf(float complex z) { return crealf(z) - cimagf(z) * I; }
long double complex conjl(long double complex z) { return creall(z) - cimagl(z) * I; }
