
# 函数原型：void push_r0()
# 把r2的值推入栈顶

scoreboard players add rsp vm_regs 1

data modify storage std:vm s2 set value {name: "r0", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/push with storage std:vm s2
