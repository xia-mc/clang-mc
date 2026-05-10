#include <minecraft.h>

int main(void) {
    Target player;
    McfString name;
    McfString x;
    McfString y;
    McfString z;
    int before;
    int after;

    player = Target_FromLiteral("CodexBot");
    if (player == 0)
        return 100;
    name = Target_GetMcf(player);
    before = _McfString_GetSlotId(name);
    __asm volatile (
        "inline data modify storage std:vm trace_ptrs_before set value %{player: %0, mcf: %1, slot: %2, len: %3, cap: %4, flags: %5%}"
        :
        : "r"(player), "r"(name), "r"(name->slot_id), "r"((int)name->len), "r"((int)name->cap), "r"(name->flags)
    );

    x = McfString_FromDouble(2.5);
    y = McfString_FromDouble(82.0);
    z = McfString_FromDouble(2.5);
    name = Target_GetMcf(player);
    __asm volatile (
        "inline data modify storage std:vm trace_ptrs_created set value %{player: %0, mcf: %1, slot: %2, len: %3, cap: %4, flags: %5%}"
        :
        : "r"(player), "r"(name), "r"(name->slot_id), "r"((int)name->len), "r"((int)name->cap), "r"(name->flags)
    );
    McfString_Release(x);
    McfString_Release(y);
    McfString_Release(z);

    name = Target_GetMcf(player);
    after = _McfString_GetSlotId(name);
    __asm volatile (
        "inline data modify storage std:vm trace_ptrs_after set value %{player: %0, mcf: %1, slot: %2, len: %3, cap: %4, flags: %5%}"
        :
        : "r"(player), "r"(name), "r"(name->slot_id), "r"((int)name->len), "r"((int)name->cap), "r"(name->flags)
    );
    Target_Release(player);

    if (before != 0)
        return 110 + before;
    if (after != 0)
        return 120 + after;
    return 0;
}
