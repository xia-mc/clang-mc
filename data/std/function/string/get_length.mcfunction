# 函数原型：int get_length(String string)
# 获取字符串常量池中字符串的长度

data modify storage std:vm r4 set value {string: -1}
execute store result storage std:vm r4.string int 1 run scoreboard players get r0 vm_regs

function std:_internal/get_length with storage std:vm r4
