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

static void
set_slot_value(int slot_id, const char *text)
{
    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, value: \"\"%}\n"
        "inline data modify storage std:vm s6.id set value %0"
        :
        : "r"(slot_id)
    );
    __mc_string_begin(text);
    __asm volatile (
        "inline data modify storage std:vm s6.value set from storage std:vm s1.str\n"
        "inline function std:_internal/mcstr_set_slot_value with storage std:vm s6"
    );
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

    set_slot_value(first, "abc");
    set_slot_value(second, "xyz");
    return first * 10 + second;
}
