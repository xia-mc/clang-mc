# 函数原型：void print(String string)
# 打印字符串，会显示给全部玩家

data modify storage std:vm r5 set value {string: -1}
execute store result storage std:vm r5.string int 1 run scoreboard players get r0 vm_regs

function std:_internal/print with storage std:vm r5
