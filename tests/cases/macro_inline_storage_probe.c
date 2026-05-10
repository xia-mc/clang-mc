int main(void) {
    int got;

    __asm volatile (
        "inline data modify storage std:vm ls0.x set value 7\n"
        "inline $data modify storage std:vm s1.probe set value $(x)"
    );
    __asm volatile (
        "inline execute store result score %0 vm_regs run data get storage std:vm s1.probe"
        : "=r"(got)
    );
    return got == 7 ? 0 : got + 100;
}
