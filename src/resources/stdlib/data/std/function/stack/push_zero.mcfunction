# 函数原型：void push_zero()
# 把0推入栈顶

data modify storage std:vm stack append value 0
scoreboard players add rsp vm_regs 1
