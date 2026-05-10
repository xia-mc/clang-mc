#include <stdarg.h>
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <limits.h>
#include <string.h>
#include <stdlib.h>

typedef enum {
    LEN_DEFAULT = 0,
    LEN_HH,
    LEN_H,
    LEN_L,
    LEN_LL,
    LEN_LD,
    LEN_Z,
    LEN_T
} len_mod_t;

typedef struct {
    char  *buf;
    size_t cap;
    size_t len;
} out_t;

static void
out_char(out_t *o, char c)
{
    if (o->cap > 0 && o->len + 1 < o->cap)
        o->buf[o->len] = c;
    o->len++;
}

static void
out_repeat(out_t *o, char c, int n)
{
    while (n-- > 0)
        out_char(o, c);
}

static void
out_mem(out_t *o, const char *s, size_t n)
{
    size_t i;
    for (i = 0; i < n; ++i)
        out_char(o, s[i]);
}

static int
parse_uint10(const char **p)
{
    int v = 0;
    while (**p >= '0' && **p <= '9') {
        v = v * 10 + (**p - '0');
        (*p)++;
    }
    return v;
}

static long long
get_signed_arg(va_list *ap, len_mod_t len)
{
    switch (len) {
    case LEN_HH:
        return (signed char)va_arg(*ap, int);
    case LEN_H:
        return (short)va_arg(*ap, int);
    case LEN_L:
        return va_arg(*ap, long);
    case LEN_LL:
        return va_arg(*ap, long long);
    case LEN_Z:
        return (long long)va_arg(*ap, ptrdiff_t);
    case LEN_T:
        return (long long)va_arg(*ap, ptrdiff_t);
    default:
        return va_arg(*ap, int);
    }
}

static unsigned long long
get_unsigned_arg(va_list *ap, len_mod_t len)
{
    switch (len) {
    case LEN_HH:
        return (unsigned char)va_arg(*ap, unsigned int);
    case LEN_H:
        return (unsigned short)va_arg(*ap, unsigned int);
    case LEN_L:
        return va_arg(*ap, unsigned long);
    case LEN_LL:
        return va_arg(*ap, unsigned long long);
    case LEN_Z:
        return (unsigned long long)va_arg(*ap, size_t);
    case LEN_T:
        return (unsigned long long)va_arg(*ap, ptrdiff_t);
    default:
        return va_arg(*ap, unsigned int);
    }
}

static double
get_float_arg(va_list *ap, len_mod_t len)
{
    if (len == LEN_LD)
        return (double)va_arg(*ap, long double);
    return va_arg(*ap, double);
}

static int
utoa_base(unsigned long long v, unsigned base, int upper, char *out_rev)
{
    const char *digits = upper ? "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" : "0123456789abcdefghijklmnopqrstuvwxyz";
    int         n = 0;

    if (v == 0) {
        out_rev[n++] = '0';
        return n;
    }
    while (v != 0) {
        out_rev[n++] = digits[v % base];
        v /= base;
    }
    return n;
}

static void
format_integer(out_t *o, unsigned long long uval, int neg, int base, int upper, int alt, int left, int plus,
               int space, int zero, int width, int precision)
{
    char rev[64];
    int  n = 0;
    int  i;
    int  sign_ch = 0;
    int  prefix_len = 0;
    char prefix0 = 0;
    char prefix1 = 0;
    int  zero_pad = 0;
    int  space_pad = 0;
    int  body_len;

    if (base < 2 || base > 16)
        return;

    if (precision == 0 && uval == 0) {
        n = 0;
    } else {
        n = utoa_base(uval, (unsigned)base, upper, rev);
    }

    if (neg)
        sign_ch = '-';
    else if (plus)
        sign_ch = '+';
    else if (space)
        sign_ch = ' ';

    if (alt) {
        if (base == 8) {
            if (n == 0 || rev[n - 1] != '0') {
                prefix0 = '0';
                prefix_len = 1;
            }
        } else if (base == 16 && uval != 0) {
            prefix0 = '0';
            prefix1 = upper ? 'X' : 'x';
            prefix_len = 2;
        }
    }

    if (precision >= 0) {
        if (precision > n)
            zero_pad = precision - n;
        zero = 0;
    }

    body_len = n + zero_pad + prefix_len + (sign_ch ? 1 : 0);
    if (width > body_len)
        space_pad = width - body_len;

    if (!left && !zero)
        out_repeat(o, ' ', space_pad);

    if (sign_ch)
        out_char(o, (char)sign_ch);
    if (prefix_len >= 1)
        out_char(o, prefix0);
    if (prefix_len >= 2)
        out_char(o, prefix1);

    if (!left && zero)
        out_repeat(o, '0', space_pad);
    out_repeat(o, '0', zero_pad);

    for (i = n - 1; i >= 0; --i)
        out_char(o, rev[i]);

    if (left)
        out_repeat(o, ' ', space_pad);
}

static void
uppercase_ascii(char *s)
{
    while (*s) {
        if (*s >= 'a' && *s <= 'z')
            *s = (char)(*s - ('a' - 'A'));
        ++s;
    }
}

static void
trim_trailing_zeros(char *s)
{
    char  *exp = strchr(s, 'e');
    char  *dot;
    size_t tail_len;
    char  *p;

    if (!exp)
        exp = strchr(s, 'E');
    if (!exp)
        exp = s + strlen(s);

    dot = strchr(s, '.');
    if (!dot || dot >= exp)
        return;

    p = exp;
    while (p > dot + 1 && p[-1] == '0')
        --p;
    if (p == dot + 1)
        --p;

    tail_len = strlen(exp);
    memmove(p, exp, tail_len + 1);
}

static void
ensure_decimal_point(char *s)
{
    char *exp = strchr(s, 'e');
    char *dot;

    if (!exp)
        exp = strchr(s, 'E');
    if (!exp)
        exp = s + strlen(s);

    dot = strchr(s, '.');
    if (dot && dot < exp)
        return;

    memmove(exp + 1, exp, strlen(exp) + 1);
    *exp = '.';
}

static int
normalize_special_fp(double value, char *buf, int upper)
{
    if (value != value) {
        memcpy(buf, upper ? "NAN" : "nan", 4);
        return 1;
    }
    if (value > __DBL_MAX__ || value < -__DBL_MAX__) {
        memcpy(buf, upper ? "INF" : "inf", 4);
        return 1;
    }
    return 0;
}

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
extract_sig_digits(double value, int ndigit, char *digits, int *exp10_out)
{
    double x = value;
    double tail = 0.0;
    int    exp10 = 0;
    int    i;
    int    round_up = 0;

    if (ndigit < 1)
        ndigit = 1;

    if (x == 0.0) {
        digits[0] = '0';
        digits[1] = '\0';
        *exp10_out = 0;
        return 1;
    }

    while (x >= 10.0) {
        x *= 0.1;
        ++exp10;
    }
    while (x < 1.0) {
        x *= 10.0;
        --exp10;
    }

    for (i = 0; i <= ndigit; ++i) {
        int d = (int)x;
        if (d < 0)
            d = 0;
        if (d > 9)
            d = 9;
        digits[i] = (char)('0' + d);
        x = (x - (double)d) * 10.0;
        if (x < 0.0)
            x = 0.0;
    }
    tail = x;

    if (digits[ndigit] > '5') {
        round_up = 1;
    } else if (digits[ndigit] == '5') {
        if (tail > 1e-9) {
            round_up = 1;
        } else {
            round_up = ((digits[ndigit - 1] - '0') & 1);
        }
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
            ++exp10;
        }
    }

    digits[ndigit] = '\0';
    *exp10_out = exp10;
    return ndigit;
}

static int
build_fixed_fp(double value, int precision, int alt, int upper, char *buf)
{
    char                whole_rev[64];
    char                frac_digits[64];
    int                 whole_i;
    int                 frac_i = 0;
    double              whole_d;
    double              frac;
    int                 whole_n;
    int                 i;
    int                 idx = 0;

    if (precision < 0)
        precision = 6;
    if (precision > 9)
        precision = 9;

    if (normalize_special_fp(value, buf, upper))
        return (int)strlen(buf);

    whole_d = floor(value);
    if (whole_d > (double)INT_MAX)
        whole_d = (double)INT_MAX;
    whole_i = (int)whole_d;
    frac = value - whole_d;
    if (frac < 0.0)
        frac = 0.0;

    for (i = 0; i <= precision; ++i) {
        frac *= 10.0;
        frac_i = (int)frac;
        if (frac_i > 9)
            frac_i = 9;
        frac_digits[i] = (char)('0' + frac_i);
        frac -= (double)frac_i;
        if (frac < 0.0)
            frac = 0.0;
    }

    if (precision > 0 && frac_digits[precision] >= '5') {
        i = precision - 1;
        while (i >= 0 && frac_digits[i] == '9') {
            frac_digits[i] = '0';
            --i;
        }
        if (i >= 0) {
            frac_digits[i] = (char)(frac_digits[i] + 1);
        } else {
            ++whole_i;
        }
    } else if (precision == 0 && frac_digits[0] >= '5') {
        ++whole_i;
    }

    whole_n = utoa_base((unsigned long long)(unsigned int)whole_i, 10, 0, whole_rev);
    for (i = whole_n - 1; i >= 0; --i)
        buf[idx++] = whole_rev[i];

    if (precision > 0 || alt)
        buf[idx++] = '.';

    for (i = 0; i < precision; ++i)
        buf[idx++] = frac_digits[i];

    buf[idx] = '\0';
    return idx;
}

static int
build_exp_fp(double value, int precision, int alt, int upper, char *buf)
{
    char digits[96];
    int  exp10;
    int  idx = 0;
    int  i;
    if (precision < 0)
        precision = 6;

    if (normalize_special_fp(value, buf, upper))
        return (int)strlen(buf);

    extract_sig_digits(value, precision + 1, digits, &exp10);

    buf[idx++] = digits[0];
    if (precision > 0 || alt) {
        buf[idx++] = '.';
        for (i = 1; i <= precision; ++i)
            buf[idx++] = digits[i];
    }

    buf[idx++] = upper ? 'E' : 'e';
    if (exp10 < 0) {
        buf[idx++] = '-';
        exp10 = -exp10;
    } else {
        buf[idx++] = '+';
    }

    if (exp10 >= 100) {
        char *start = buf + idx;
        while (exp10 > 0) {
            buf[idx++] = (char)('0' + (exp10 % 10));
            exp10 /= 10;
        }
        reverse_range(start, buf + idx - 1);
    } else {
        buf[idx++] = (char)('0' + (exp10 / 10));
        buf[idx++] = (char)('0' + (exp10 % 10));
    }

    buf[idx] = '\0';
    if (upper)
        uppercase_ascii(buf);
    return idx;
}

static int
build_general_fp(double value, int precision, int alt, int upper, char *buf)
{
    int sig;

    if (precision < 0)
        sig = 6;
    else if (precision == 0)
        sig = 1;
    else
        sig = precision;

    if (normalize_special_fp(value, buf, upper))
        return (int)strlen(buf);

    if (gcvt_fast(value, sig, buf) == NULL) {
        buf[0] = '\0';
        return 0;
    }
    if (alt)
        ensure_decimal_point(buf);
    if (upper)
        uppercase_ascii(buf);
    return (int)strlen(buf);
}

static void
format_float(out_t *o, double value, char spec, int alt, int left, int plus, int space, int zero, int width,
             int precision, len_mod_t len)
{
    char        buf[256];
    const char *body;
    size_t      body_len;
    char        sign_ch = 0;
    int         lower_spec = spec;
    int         upper = 0;
    int         pad;

    (void)len;

    if (lower_spec >= 'A' && lower_spec <= 'Z') {
        upper = 1;
        lower_spec = lower_spec - ('A' - 'a');
    }

    if (signbit(value)) {
        sign_ch = '-';
        value = -value;
    } else if (plus) {
        sign_ch = '+';
    } else if (space) {
        sign_ch = ' ';
    }

    switch (lower_spec) {
    case 'f':
        body_len = (size_t)build_fixed_fp(value, precision, alt, upper, buf);
        break;
    case 'e':
        body_len = (size_t)build_exp_fp(value, precision, alt, upper, buf);
        break;
    case 'g':
        body_len = (size_t)build_general_fp(value, precision, alt, upper, buf);
        break;
    default:
        body = "";
        body_len = 0;
        goto emit;
    }

    body = buf;

emit:
    pad = width - (int)body_len - (sign_ch ? 1 : 0);
    if (pad < 0)
        pad = 0;

    if (!left && !zero)
        out_repeat(o, ' ', pad);
    if (sign_ch)
        out_char(o, sign_ch);
    if (!left && zero)
        out_repeat(o, '0', pad);
    out_mem(o, body, body_len);
    if (left)
        out_repeat(o, ' ', pad);
}

int
vsnprintf(char *s, size_t n, const char *fmt, va_list ap)
{
    out_t       out;
    const char *p = fmt;

    out.buf = s;
    out.cap = n;
    out.len = 0;

    while (*p) {
        int      left = 0, plus = 0, space = 0, alt = 0, zero = 0;
        int      width = 0, precision = -1;
        len_mod_t len = LEN_DEFAULT;
        char     spec;

        if (*p != '%') {
            out_char(&out, *p++);
            continue;
        }
        p++;

        for (;;) {
            if (*p == '-') {
                left = 1;
                p++;
            } else if (*p == '+') {
                plus = 1;
                p++;
            } else if (*p == ' ') {
                space = 1;
                p++;
            } else if (*p == '#') {
                alt = 1;
                p++;
            } else if (*p == '0') {
                zero = 1;
                p++;
            } else {
                break;
            }
        }

        if (*p == '*') {
            width = va_arg(ap, int);
            p++;
            if (width < 0) {
                left = 1;
                width = -width;
            }
        } else if (*p >= '0' && *p <= '9') {
            width = parse_uint10(&p);
        }

        if (*p == '.') {
            p++;
            if (*p == '*') {
                precision = va_arg(ap, int);
                p++;
                if (precision < 0)
                    precision = -1;
            } else {
                precision = parse_uint10(&p);
            }
        }

        if (*p == 'h') {
            p++;
            len = LEN_H;
            if (*p == 'h') {
                p++;
                len = LEN_HH;
            }
        } else if (*p == 'l') {
            p++;
            len = LEN_L;
            if (*p == 'l') {
                p++;
                len = LEN_LL;
            }
        } else if (*p == 'L') {
            p++;
            len = LEN_LD;
        } else if (*p == 'z') {
            p++;
            len = LEN_Z;
        } else if (*p == 't') {
            p++;
            len = LEN_T;
        }

        spec = *p ? *p++ : '\0';
        if (spec == '\0')
            break;

        switch (spec) {
        case 'd':
        case 'i': {
            long long          v = get_signed_arg(&ap, len);
            unsigned long long u;
            int                neg = 0;
            if (v < 0) {
                neg = 1;
                u = (unsigned long long)(-(v + 1)) + 1ULL;
            } else {
                u = (unsigned long long)v;
            }
            format_integer(&out, u, neg, 10, 0, 0, left, plus, space, zero, width, precision);
            break;
        }
        case 'u': {
            unsigned long long u = get_unsigned_arg(&ap, len);
            format_integer(&out, u, 0, 10, 0, 0, left, 0, 0, zero, width, precision);
            break;
        }
        case 'x':
        case 'X': {
            unsigned long long u = get_unsigned_arg(&ap, len);
            format_integer(&out, u, 0, 16, spec == 'X', alt, left, 0, 0, zero, width, precision);
            break;
        }
        case 'o': {
            unsigned long long u = get_unsigned_arg(&ap, len);
            format_integer(&out, u, 0, 8, 0, alt, left, 0, 0, zero, width, precision);
            break;
        }
        case 'c': {
            char ch = (char)va_arg(ap, int);
            if (!left)
                out_repeat(&out, ' ', width > 1 ? width - 1 : 0);
            out_char(&out, ch);
            if (left)
                out_repeat(&out, ' ', width > 1 ? width - 1 : 0);
            break;
        }
        case 'f':
        case 'F':
        case 'e':
        case 'E':
        case 'g':
        case 'G': {
            double v = get_float_arg(&ap, len);
            format_float(&out, v, spec, alt, left, plus, space, zero, width, precision, len);
            break;
        }
        case 's': {
            const char *str = va_arg(ap, const char *);
            size_t      slen;
            if (!str)
                str = "(null)";
            slen = strlen(str);
            if (precision >= 0 && (size_t)precision < slen)
                slen = (size_t)precision;

            if (!left && width > (int)slen)
                out_repeat(&out, ' ', width - (int)slen);
            out_mem(&out, str, slen);
            if (left && width > (int)slen)
                out_repeat(&out, ' ', width - (int)slen);
            break;
        }
        case 'p': {
            uintptr_t u = (uintptr_t)va_arg(ap, void *);
            format_integer(&out, (unsigned long long)u, 0, 16, 0, 1, left, 0, 0, zero, width, precision);
            break;
        }
        case 'n': {
            switch (len) {
            case LEN_HH:
                *va_arg(ap, signed char *) = (signed char)out.len;
                break;
            case LEN_H:
                *va_arg(ap, short *) = (short)out.len;
                break;
            case LEN_L:
                *va_arg(ap, long *) = (long)out.len;
                break;
            case LEN_LL:
                *va_arg(ap, long long *) = (long long)out.len;
                break;
            case LEN_Z:
                *va_arg(ap, size_t *) = (size_t)out.len;
                break;
            case LEN_T:
                *va_arg(ap, ptrdiff_t *) = (ptrdiff_t)out.len;
                break;
            default:
                *va_arg(ap, int *) = (int)out.len;
                break;
            }
            break;
        }
        case '%': {
            if (!left && width > 1)
                out_repeat(&out, zero ? '0' : ' ', width - 1);
            out_char(&out, '%');
            if (left && width > 1)
                out_repeat(&out, ' ', width - 1);
            break;
        }
        default:
            out_char(&out, '%');
            out_char(&out, spec);
            break;
        }
    }

    if (out.cap > 0) {
        size_t term = (out.len < out.cap - 1) ? out.len : (out.cap - 1);
        out.buf[term] = '\0';
    }

    if (out.len > (size_t)INT_MAX)
        return -1;
    return (int)out.len;
}
