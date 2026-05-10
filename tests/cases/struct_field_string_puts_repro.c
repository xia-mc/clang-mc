#include <stdio.h>

typedef struct {
    const char *text;
} TextHolder;

static TextHolder HOLDER = {"abc"};

int
main(void)
{
    puts(HOLDER.text);
    return 0;
}
