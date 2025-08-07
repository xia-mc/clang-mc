# 函数原型：void expand(int size)
# 扩展堆空间额外size个元素的大小，每个元素通常4字节
# size将被向上取整到8的倍数(32字节)

scoreboard players add shp vm_regs 8
scoreboard players remove r0 vm_regs 8

data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0
data modify storage std:vm heap append value 0

execute if score r0 vm_regs matches 1.. run function std:heap/expand
