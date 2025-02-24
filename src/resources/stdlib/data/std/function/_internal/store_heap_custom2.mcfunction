# 函数原型：void store_heap_custom2()
# 汇编器的辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void store_heap_custom2(int ptr, int value)

$data modify storage std:vm heap[$(ptr)] set value $(value)
