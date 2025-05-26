# 函数原型：void push_zero()
# 把0推入栈顶

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs
function std:_internal/push_zero with storage std:vm s2
