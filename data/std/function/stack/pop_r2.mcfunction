# 函数原型：void pop_r2()
# 取出栈顶的值，存入r2

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {name: "r2", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/pop with storage std:vm s2
