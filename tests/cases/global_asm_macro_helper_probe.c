__asm__(
"export probe:macro_helper:\n"
"    inline $data modify storage std:vm s1.probe set value $(x)\n"
"    ret\n"
);

int main(void) {
    int got;

    __asm volatile (
        "inline data modify storage std:vm ls0.x set value 9\n"
        "inline function probe:macro_helper with storage std:vm ls0\n"
        "inline execute store result score %0 vm_regs run data get storage std:vm s1.probe"
        : "=r"(got)
    );
    return got == 9 ? 0 : got + 100;
}
