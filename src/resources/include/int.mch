#once

export std:_internal/declen:
    inline execute if score r0 vm_regs matches -9.. run return 1
    inline execute if score r0 vm_regs matches -99.. run return 2
    inline execute if score r0 vm_regs matches -999.. run return 3
    inline execute if score r0 vm_regs matches -9999.. run return 4
    inline execute if score r0 vm_regs matches -99999.. run return 5
    inline execute if score r0 vm_regs matches -999999.. run return 6
    inline execute if score r0 vm_regs matches -9999999.. run return 7
    inline execute if score r0 vm_regs matches -99999999.. run return 8
    inline return 9


// int Int_Declen(int value)
Int_Declen:
    mov t0, r0
    jl r0, 0, .begin
    mul r0, -1
.begin:
    inline execute store result score rax vm_regs run function std:_internal/declen
    rge t0, 0
    add rax, 1
    ret


// void Int_ToString(char *result, int value)
Int_ToString:
    // 特殊处理0
    je r1, 0, .special_0
    // 特殊处理-2147483648
    je r1, -2147483648, .special_INT_MIN

    push x0
    push x1

    // char *x0;  // result
    // int x1;  // value
    mov x0, r0
    mov x1, r1
    mov r0, x1
    call Int_Declen

    // 特殊处理负数
    jg x1, 0, .before_loop
    mov [x0], '-'
    mul x1, -1

.before_loop:
    // char *x0;  // result (指向十进制字符串最后一位)
    add x0, rax
    mov [x0], 0  // C字符串结束符

    // int r0;  // tmp
    // int r1;  // tmp2
.loop:
    sub x0, 1

    // r0 = value;
    // r1 = r0 % 10;
    // value /= 10;
    mov r0, x1
    div x1, 10
    mov r1, x1
    mul r1, 10
    // 此时r1为最后一位数为0的r0

    sub r0, r1
    add r0, 48  // 转换成ascii码值

    mov [x0], r0

    jg x1, 0, .loop

    pop x1
    pop x0
    ret

.special_0:
    mov [r0], '0'
    mov [r0 + 1], 0  // C字符串结束符
    ret

.special_INT_MIN:
    mov [r0], '-'
    mov [r0 + 1], '2'
    mov [r0 + 2], '1'
    mov [r0 + 3], '4'
    mov [r0 + 4], '7'
    mov [r0 + 5], '4'
    mov [r0 + 6], '8'
    mov [r0 + 7], '3'
    mov [r0 + 8], '6'
    mov [r0 + 9], '4'
    mov [r0 + 10], '8'
    mov [r0 + 11], 0
    ret
