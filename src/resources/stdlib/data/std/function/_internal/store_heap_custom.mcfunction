# 函数原型：void store_heap_custom()
# 汇编器的辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void store_heap_custom(int ptr, NBTString value)

$execute store result storage std:vm heap[$(ptr)] int 1 run scoreboard players get $(value) vm_regs
