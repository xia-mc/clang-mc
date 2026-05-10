static void probe(int value) {
    (void)value;
    __asm volatile (
        "inline $data modify storage std:vm ls0.a set value 8\n"
        "inline $data modify storage std:vm s1.probe set value $(a)"
        :
        : "r"(value)
    );
}

int main(void) {
    int got;

    probe(7);
    __asm volatile (
        "inline execute store result score %0 vm_regs run data get storage std:vm s1.probe"
        : "=r"(got)
    );
    return got == 8 ? 0 : got + 100;
}
