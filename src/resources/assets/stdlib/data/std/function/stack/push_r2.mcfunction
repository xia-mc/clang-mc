# 不要修改此文件，该文件由脚本生成
# 函数原型：void push_r2()
# 把r2的值推入栈顶

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {name: "r2", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/push with storage std:vm s2
