# 函数原型：char char_at(String string, int index)
# 不会检查index是否有效

scoreboard players operation r2 vm_regs = r1 vm_regs
scoreboard players add r2 vm_regs 1
function std:string/substring
# 此时rax为StringRef

scoreboard players operation r0 vm_regs = rax vm_regs
function std:string/to_char
# 此时rax为结果

# 释放substring切下来的字符串，防止内存泄漏
function std:string/free_str
