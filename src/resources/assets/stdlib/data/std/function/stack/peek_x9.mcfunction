# 不要修改此文件，该文件由脚本生成
# 函数原型：void peek_x9()
# 获取但不移除栈顶的值，存入x9

data modify storage std:vm s2 set value {name: "x9", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/peek with storage std:vm s2
