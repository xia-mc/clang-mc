# 函数原型：void store_heap([[maybe_unused]] int ptr, int value)
# heap/store的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void store_heap(int ptr)

$execute store result storage std:vm heap[$(ptr)] int 1 run scoreboard players get r1 vm_regs
