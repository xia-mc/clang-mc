#once

#include "stdlib"
#include "stdio"

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


// int __builtin_declen(int value)
__builtin_declen:
    mov t0, r0
    jl r0, 0, .begin
    mul r0, -1
.begin:
    inline execute store result score rax vm_regs run function std:_internal/declen
    rge t0, 0
    add rax, 1
    ret


#define __builtin_Event_Unreg_TICK(labelName) inline schedule clear std:_internal/_wrapper_labelName

#define __builtin_Event_Reg_TICK(labelName) \
    #push line \
    #push label \
    inline schedule function std:_internal/_wrapper_labelName 1t \
    jmp after \
export std:_internal/_wrapper_labelName: \
    inline schedule function std:_internal/_wrapper_labelName 1t \
    jmp labelName \
after: \
    #pop label \
    #pop line
