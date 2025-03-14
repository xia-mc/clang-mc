# 函数原型：int load(int ptr)
# 获取堆中对应地址的元素

data modify storage std:vm s2 set value {ptr: -1}
execute store result storage std:vm s2.ptr int 1 run scoreboard players get r0 vm_regs
function std:_internal/load_heap with storage std:vm s2
