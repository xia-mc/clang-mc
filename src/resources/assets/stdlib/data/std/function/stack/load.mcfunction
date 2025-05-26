# 函数原型：int load(int index)
# 获取栈顶下第index个元素的值，栈顶元素index为0

scoreboard players operation rsp vm_regs -= r0 vm_regs

data modify storage std:vm s2 set value {ptr: -1}
execute store result storage std:vm s2.ptr int 1 run scoreboard players get rsp vm_regs
function std:_internal/load_heap with storage std:vm s2

scoreboard players operation rsp vm_regs += r0 vm_regs
