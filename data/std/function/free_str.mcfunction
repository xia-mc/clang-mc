# 函数原型：void free_str(String string)
# 释放一个常量字符串池中的字符串

data modify storage std:vm r4 set value {string: -1}
execute store result storage std:vm r4.string int 1 run scoreboard players get r0 vm_regs
function std:_internal/free_str with storage std:vm r4

scoreboard players remove rpp vm_regs 1
