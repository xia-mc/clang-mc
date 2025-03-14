
# 函数原型：void peek_t1()
# 获取但不移除栈顶的值，存入t1

data modify storage std:vm s2 set value {name: "t1", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/peek with storage std:vm s2
