#include <mcstr.h>

static int
alloc_slot(void)
{
    int slot_id;

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1%}\n"
        "inline function std:_internal/mcstr_alloc with storage std:vm s6\n"
        "inline scoreboard players operation %0 vm_regs = rax vm_regs"
        : "=r"(slot_id)
    );
    return slot_id;
}

int
main(void)
{
    int first;
    int second;

    first = alloc_slot();
    second = alloc_slot();
    if (first < 0 || second < 0)
        return 100;
    return first * 10 + second;
}
