/*
 * Lightweight gcvt implementation with %g-like selection:
 * - fixed form when -4 <= exp10 < ndigit
 * - scientific form otherwise
 */

#include <limits.h>
#include <stdlib.h>

static void
reverse_range(char *start, char *end)
{
    while (start < end) {
        char t = *start;
        *start++ = *end;
        *end-- = t;
    }
}

static int
is_nan(double x)
{
    return x != x;
}

static int
is_inf(double x)
{
    return x > __DBL_MAX__ || x < -__DBL_MAX__;
}

static char *
write_uint_dec(char *p, unsigned int value)
{
    char rev[16];
    int  n = 0;

    if (value == 0) {
        *p++ = '0';
        return p;
    }

    while (value != 0) {
        rev[n++] = (char)('0' + (value % 10u));
        value /= 10u;
    }
    while (n > 0) {
        *p++ = rev[--n];
    }
    return p;
}

static int
uint_dec_digits(unsigned int value)
{
    int n = 1;

    while (value >= 10u) {
        value /= 10u;
        ++n;
    }
    return n;
}

static int
try_simple_decimal(double x, int ndigit, char *p, char **end_out)
{
    int whole;
    int half_units;
    int digits;

    if (x < 0.0 || x > (double)INT_MAX) {
        return 0;
    }

    whole = (int)x;
    if (x == (double)whole) {
        digits = uint_dec_digits((unsigned int)whole);
        if (digits > ndigit) {
            return 0;
        }
        p = write_uint_dec(p, (unsigned int)whole);
        *p = '\0';
        *end_out = p;
        return 1;
    }

    if (ndigit >= 2 && x <= (double)(INT_MAX / 2)) {
        double scaled = x * 2.0;
        half_units = (int)scaled;
        if (scaled == (double)half_units && (half_units & 1) != 0) {
            digits = uint_dec_digits((unsigned int)(half_units / 2)) + 1;
            if (digits > ndigit) {
                return 0;
            }
            p = write_uint_dec(p, (unsigned int)(half_units / 2));
            *p++ = '.';
            *p++ = '5';
            *p = '\0';
            *end_out = p;
            return 1;
        }
    }

    return 0;
}

char *
gcvt_fast(double value, int ndigit, char *buf)
{
    char  *p = buf;
    int    exp10 = 0;
    int    i;
    int    use_sci;
    int    lead;
    int    round_up;
    double x;
    char   digits[64];
    int    sig;

    if (buf == NULL)
        return NULL;

    if (ndigit <= 0) {
        buf[0] = '\0';
        return buf;
    }
    if (ndigit > (int)(sizeof(digits) - 1))
        ndigit = (int)(sizeof(digits) - 1);

    if (is_nan(value)) {
        buf[0] = 'n';
        buf[1] = 'a';
        buf[2] = 'n';
        buf[3] = '\0';
        return buf;
    }

    if (is_inf(value)) {
        if (value < 0.0) {
            *p++ = '-';
        }
        p[0] = 'i';
        p[1] = 'n';
        p[2] = 'f';
        p[3] = '\0';
        return buf;
    }

    if (value < 0.0) {
        *p++ = '-';
        x = -value;
    } else {
        x = value;
    }

    if (x == 0.0) {
        p[0] = '0';
        p[1] = '\0';
        return buf;
    }

    if (try_simple_decimal(x, ndigit, p, &p)) {
        return buf;
    }

    while (x >= 10.0) {
        x *= 0.1;
        exp10++;
    }
    while (x < 1.0) {
        x *= 10.0;
        exp10--;
    }

    for (i = 0; i < ndigit + 1; ++i) {
        int d = (int)x;
        digits[i] = (char)('0' + d);
        x = (x - (double)d) * 10.0;
    }

    round_up = 0;
    if (digits[ndigit] > '5') {
        round_up = 1;
    } else if (digits[ndigit] == '5') {
        round_up = (x > 0.000000001 || ((digits[ndigit - 1] - '0') & 1) != 0);
    }

    if (round_up) {
        i = ndigit - 1;
        while (i >= 0 && digits[i] == '9') {
            digits[i] = '0';
            --i;
        }
        if (i >= 0) {
            digits[i] = (char)(digits[i] + 1);
        } else {
            for (i = ndigit; i > 0; --i)
                digits[i] = digits[i - 1];
            digits[0] = '1';
            exp10++;
        }
    }

    sig = ndigit;
    while (sig > 1 && digits[sig - 1] == '0')
        --sig;

    use_sci = (exp10 < -4 || exp10 >= ndigit);
    if (use_sci) {
        *p++ = digits[0];
        if (sig > 1) {
            *p++ = '.';
            for (i = 1; i < sig; ++i)
                *p++ = digits[i];
        }
        *p++ = 'e';
        if (exp10 < 0) {
            *p++ = '-';
            exp10 = -exp10;
        } else {
            *p++ = '+';
        }
        lead = exp10 / 10;
        if (lead == 0)
            *p++ = '0';
        else {
            char *start = p;
            while (lead > 0) {
                *p++ = (char)('0' + (lead % 10));
                lead /= 10;
            }
            reverse_range(start, p - 1);
        }
        *p++ = (char)('0' + (exp10 % 10));
    } else {
        if (exp10 >= 0) {
            int int_digits = exp10 + 1;
            for (i = 0; i < int_digits; ++i) {
                if (i < sig)
                    *p++ = digits[i];
                else
                    *p++ = '0';
            }
            if (sig > int_digits) {
                *p++ = '.';
                for (i = int_digits; i < sig; ++i)
                    *p++ = digits[i];
            }
        } else {
            *p++ = '0';
            *p++ = '.';
            for (i = 0; i < -exp10 - 1; ++i)
                *p++ = '0';
            for (i = 0; i < sig; ++i)
                *p++ = digits[i];
        }
    }

    *p = '\0';
    return buf;
}
