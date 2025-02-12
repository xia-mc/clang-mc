# 函数原型：void store(int ptr, int value)
# 把value存入堆中对应的地址

data modify storage std:vm s2 set value {ptr: -1}
execute store result storage std:vm s2.ptr int 1 run scoreboard players get r0 vm_regs
function std:_internal/store_heap with storage std:vm s2
