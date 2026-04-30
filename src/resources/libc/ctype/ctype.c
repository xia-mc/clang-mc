#include <ctype.h>

static int
__libc_is_ascii(int c)
{
    return c >= 0 && c <= 0x7f;
}

int
isupper(int c)
{
    return c >= 'A' && c <= 'Z';
}

int
islower(int c)
{
    return c >= 'a' && c <= 'z';
}

int
isalpha(int c)
{
    return isupper(c) || islower(c);
}

int
isdigit(int c)
{
    return c >= '0' && c <= '9';
}

int
isxdigit(int c)
{
    return isdigit(c) || (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f');
}

int
isalnum(int c)
{
    return isalpha(c) || isdigit(c);
}

int
isspace(int c)
{
    return c == ' ' || c == '\f' || c == '\n' || c == '\r' || c == '\t' || c == '\v';
}

int
isblank(int c)
{
    return c == ' ' || c == '\t';
}

int
iscntrl(int c)
{
    return __libc_is_ascii(c) && (c < ' ' || c == 0x7f);
}

int
isprint(int c)
{
    return c >= ' ' && c <= '~';
}

int
isgraph(int c)
{
    return c > ' ' && c <= '~';
}

int
ispunct(int c)
{
    return isgraph(c) && !isalnum(c);
}

int
tolower(int c)
{
    if (isupper(c))
        return c + ('a' - 'A');

    return c;
}

int
toupper(int c)
{
    if (islower(c))
        return c - ('a' - 'A');

    return c;
}
