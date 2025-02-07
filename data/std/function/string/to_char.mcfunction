# 函数原型：char to_char(String string)
# 把单字符字符串转换成char
# 调用者需要确保字符串长度为1；函数本身不会检查这点

data modify storage std:vm r4 set value {string: -1}
execute store result storage std:vm r4.string int 1 run scoreboard players get r0 vm_regs
execute store result score rax vm_regs run function std:_internal/to_char with storage std:vm r4
