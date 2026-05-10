#include <minecraft.h>

int main(void) {
    String s;

    __asm volatile ("inline data modify storage std:vm trace set value \"a\"");
    s = String_FromLiteral("clang-mc libmc say test");
    __asm volatile ("inline data modify storage std:vm trace set value \"b\"");
    if (s == 0)
        return 100;

    String_Release(s);
    __asm volatile ("inline data modify storage std:vm trace set value \"c\"");
    return 0;
}
