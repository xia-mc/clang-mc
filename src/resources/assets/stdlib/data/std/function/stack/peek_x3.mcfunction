# 不要修改此文件，该文件由脚本生成
# 函数原型：void peek_x3()
# 获取但不移除栈顶的值，存入x3

data modify storage std:vm s2 set value {name: "x3", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/peek with storage std:vm s2
