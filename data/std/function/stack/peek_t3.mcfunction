# 函数原型：void peek_t3()
# 获取但不移除栈顶的值，存入t3

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {name: "t3", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

scoreboard players add rsp vm_regs 1

function std:_internal/peek with storage std:vm s2
