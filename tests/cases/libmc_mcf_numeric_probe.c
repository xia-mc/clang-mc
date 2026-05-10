#include <minecraft.h>

int main(void) {
    McfString x;
    McfString y;
    McfString z;
    McfString yaw;
    McfString pitch;

    __asm volatile ("inline data modify storage std:vm trace set value \"a\"");
    x = McfString_FromDouble(2.5);
    __asm volatile ("inline data modify storage std:vm trace set value \"b\"");
    if (x == 0)
        return 100;

    y = McfString_FromDouble(82.0);
    __asm volatile ("inline data modify storage std:vm trace set value \"c\"");
    if (y == 0)
        return 101;

    z = McfString_FromDouble(6.5);
    __asm volatile ("inline data modify storage std:vm trace set value \"d\"");
    if (z == 0)
        return 102;

    yaw = McfString_FromFloat(90.0f);
    __asm volatile ("inline data modify storage std:vm trace set value \"e\"");
    if (yaw == 0)
        return 103;

    pitch = McfString_FromFloat(0.0f);
    __asm volatile ("inline data modify storage std:vm trace set value \"f\"");
    if (pitch == 0)
        return 104;

    return 0;
}
