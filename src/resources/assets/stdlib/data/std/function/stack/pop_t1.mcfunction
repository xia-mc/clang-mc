# 不要修改此文件，该文件由脚本生成
# 函数原型：void pop_t1()
# 把栈顶的值弹出到t1

scoreboard players add rsp vm_regs 1

data modify storage std:vm s2 set value {name: "t1", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/pop with storage std:vm s2
