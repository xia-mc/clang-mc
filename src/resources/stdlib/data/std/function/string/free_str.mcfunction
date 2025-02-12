# 函数原型：void free_str(String string)
# 释放一个常量字符串池中的字符串

data modify storage std:vm s2 set value {sap: -1}
execute store result storage std:vm s2.sap int 1 run scoreboard players get sap vm_regs

function std:_internal/free_str

scoreboard players add sap vm_regs 1
