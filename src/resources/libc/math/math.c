#include <errno.h>
#include <math.h>

#define PI 3.14159265358979323846
#define TWO_PI 6.28318530717958647692
#define HALF_PI 1.57079632679489661923

double fabs(double x) { return x < 0.0 ? -x : x; }
float fabsf(float x) { return x < 0.0f ? -x : x; }
long double fabsl(long double x) { return x < 0.0L ? -x : x; }

double trunc(double x) { return (double)(int)x; }
float truncf(float x) { return (float)trunc((double)x); }
long double truncl(long double x) { return (long double)trunc((double)x); }

double floor(double x)
{
    int i = (int)x;
    if ((double)i > x)
        --i;
    return (double)i;
}

float floorf(float x) { return (float)floor((double)x); }
long double floorl(long double x) { return (long double)floor((double)x); }

double ceil(double x)
{
    int i = (int)x;
    if ((double)i < x)
        ++i;
    return (double)i;
}

float ceilf(float x) { return (float)ceil((double)x); }
long double ceill(long double x) { return (long double)ceil((double)x); }

double round(double x)
{
    return x < 0.0 ? ceil(x - 0.5) : floor(x + 0.5);
}

float roundf(float x) { return (float)round((double)x); }
long double roundl(long double x) { return (long double)round((double)x); }

double sqrt(double x)
{
    double g;
    int i;
    if (x < 0.0) {
        errno = EDOM;
        return NAN;
    }
    if (x == 0.0 || isinf(x) || isnan(x))
        return x;
    g = x > 1.0 ? x : 1.0;
    for (i = 0; i < 32; ++i)
        g = 0.5 * (g + x / g);
    return g;
}

float sqrtf(float x) { return (float)sqrt((double)x); }
long double sqrtl(long double x) { return (long double)sqrt((double)x); }

static double reduce_angle(double x)
{
    while (x > PI)
        x -= TWO_PI;
    while (x < -PI)
        x += TWO_PI;
    return x;
}

double sin(double x)
{
    double x2;
    if (isnan(x) || isinf(x)) {
        errno = EDOM;
        return NAN;
    }
    x = reduce_angle(x);
    x2 = x * x;
    return x * (1.0 - x2 / 6.0 + (x2 * x2) / 120.0 - (x2 * x2 * x2) / 5040.0
        + (x2 * x2 * x2 * x2) / 362880.0);
}

float sinf(float x) { return (float)sin((double)x); }
long double sinl(long double x) { return (long double)sin((double)x); }

double cos(double x)
{
    double x2;
    if (isnan(x) || isinf(x)) {
        errno = EDOM;
        return NAN;
    }
    x = reduce_angle(x);
    x2 = x * x;
    return 1.0 - x2 / 2.0 + (x2 * x2) / 24.0 - (x2 * x2 * x2) / 720.0
        + (x2 * x2 * x2 * x2) / 40320.0;
}

float cosf(float x) { return (float)cos((double)x); }
long double cosl(long double x) { return (long double)cos((double)x); }

double tan(double x)
{
    double c = cos(x);
    if (c == 0.0) {
        errno = ERANGE;
        return x < 0.0 ? -HUGE_VAL : HUGE_VAL;
    }
    return sin(x) / c;
}

float tanf(float x) { return (float)tan((double)x); }
long double tanl(long double x) { return (long double)tan((double)x); }

double exp(double x)
{
    double term = 1.0;
    double sum = 1.0;
    int i;
    if (x > 709.0) {
        errno = ERANGE;
        return HUGE_VAL;
    }
    if (x < -745.0)
        return 0.0;
    for (i = 1; i < 40; ++i) {
        term *= x / (double)i;
        sum += term;
    }
    return sum;
}

float expf(float x) { return (float)exp((double)x); }
long double expl(long double x) { return (long double)exp((double)x); }

double log(double x)
{
    double y;
    double z;
    double z2;
    double term;
    double sum;
    int k = 0;
    int n;
    if (x < 0.0) {
        errno = EDOM;
        return NAN;
    }
    if (x == 0.0) {
        errno = ERANGE;
        return -HUGE_VAL;
    }
    if (isinf(x) || isnan(x))
        return x;
    while (x > 2.0) {
        x *= 0.5;
        ++k;
    }
    while (x < 0.5) {
        x *= 2.0;
        --k;
    }
    y = (x - 1.0) / (x + 1.0);
    z = y;
    z2 = y * y;
    sum = 0.0;
    for (n = 1; n < 50; n += 2) {
        term = z / (double)n;
        sum += term;
        z *= z2;
    }
    return 2.0 * sum + (double)k * 0.69314718055994530942;
}

float logf(float x) { return (float)log((double)x); }
long double logl(long double x) { return (long double)log((double)x); }

double pow(double x, double y)
{
    int iy = (int)y;
    double r = 1.0;
    double b = x;
    if (y == (double)iy) {
        unsigned int e = iy < 0 ? (unsigned int)-iy : (unsigned int)iy;
        while (e != 0) {
            if (e & 1U)
                r *= b;
            b *= b;
            e >>= 1;
        }
        return iy < 0 ? 1.0 / r : r;
    }
    if (x <= 0.0) {
        errno = EDOM;
        return NAN;
    }
    return exp(y * log(x));
}

float powf(float x, float y) { return (float)pow((double)x, (double)y); }
long double powl(long double x, long double y) { return (long double)pow((double)x, (double)y); }

double fmod(double x, double y)
{
    if (y == 0.0) {
        errno = EDOM;
        return NAN;
    }
    return x - trunc(x / y) * y;
}

float fmodf(float x, float y) { return (float)fmod((double)x, (double)y); }
long double fmodl(long double x, long double y) { return (long double)fmod((double)x, (double)y); }

double copysign(double x, double y) { return signbit(y) ? -fabs(x) : fabs(x); }
float copysignf(float x, float y) { return signbit(y) ? -fabsf(x) : fabsf(x); }
long double copysignl(long double x, long double y) { return signbit(y) ? -fabsl(x) : fabsl(x); }

double fmin(double x, double y) { return isnan(x) ? y : (isnan(y) ? x : (x < y ? x : y)); }
float fminf(float x, float y) { return isnan(x) ? y : (isnan(y) ? x : (x < y ? x : y)); }
long double fminl(long double x, long double y) { return isnan(x) ? y : (isnan(y) ? x : (x < y ? x : y)); }

double fmax(double x, double y) { return isnan(x) ? y : (isnan(y) ? x : (x > y ? x : y)); }
float fmaxf(float x, float y) { return isnan(x) ? y : (isnan(y) ? x : (x > y ? x : y)); }
long double fmaxl(long double x, long double y) { return isnan(x) ? y : (isnan(y) ? x : (x > y ? x : y)); }
