#include <stdio.h>
#include <assert.h>
#include <mcstr.h>

int
puts(const char *str)
{
    assert(str != NULL);
    __mc_string_begin(str);
    __asm volatile (
        "inline tellraw @a {\"storage\": \"std:vm\", \"nbt\": \"s1.str\"}"
    );
    return 1;
}
