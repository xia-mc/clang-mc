# 函数原型：void pop_ignore()
# 取出栈顶的值，并丢弃

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/pop_ignore with storage std:vm s2
