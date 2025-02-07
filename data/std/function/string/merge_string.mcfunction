# 函数原型：String merge_string(String left, String right)
# 拼接两个字符串，返回一个新引用

data modify storage std:vm r5 set value {left: -1, right: -1}
execute store result storage std:vm r5.left int 1 run scoreboard players get r0 vm_regs
execute store result storage std:vm r5.right int 1 run scoreboard players get r1 vm_regs

function std:_internal/merge_string with storage std:vm r5
