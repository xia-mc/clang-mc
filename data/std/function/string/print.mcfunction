# 函数原型：void print(String string)
# 打印字符串，会显示给全部玩家

data modify storage std:vm s4 set value {string: -1}
execute store result storage std:vm s4.string int 1 run scoreboard players get r0 vm_regs

function std:_internal/print_string with storage std:vm s4
