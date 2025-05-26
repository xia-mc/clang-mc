# 不要修改此文件，该文件由脚本生成
# 函数原型：void push_x13()
# 把x13的值推入栈顶

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {name: "x13", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/push with storage std:vm s2
