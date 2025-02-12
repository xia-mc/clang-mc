# 函数原型：void shrink(int size)
# 缩小堆空间size个元素的大小，每个元素通常4字节

execute if score r0 vm_regs matches 0 run return 0

data modify storage std:vm s2 set value {shp: -1}

# 展开4次，尽量避免stack overflow
scoreboard players remove shp vm_regs 1
scoreboard players remove r0 vm_regs 1
execute store result storage std:vm s2.shp int 1 run scoreboard players get shp vm_regs
function std:_internal/shrink_heap with storage std:vm s2

execute if score r0 vm_regs matches 0 run return 0
scoreboard players add shp vm_regs 1
scoreboard players remove r0 vm_regs 1
execute store result storage std:vm s2.shp int 1 run scoreboard players get shp vm_regs
function std:_internal/shrink_heap with storage std:vm s2

execute if score r0 vm_regs matches 0 run return 0
scoreboard players add shp vm_regs 1
scoreboard players remove r0 vm_regs 1
execute store result storage std:vm s2.shp int 1 run scoreboard players get shp vm_regs
function std:_internal/shrink_heap with storage std:vm s2

execute if score r0 vm_regs matches 0 run return 0
scoreboard players add shp vm_regs 1
scoreboard players remove r0 vm_regs 1
execute store result storage std:vm s2.shp int 1 run scoreboard players get shp vm_regs
function std:_internal/shrink_heap with storage std:vm s2

execute if score r0 vm_regs matches 1.. run function std:heap/shrink
