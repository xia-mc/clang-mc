# 函数原型：void store_stack_custom3()
# 汇编器的辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void store_stack_custom3(int to, int from)

$data modify storage std:vm stack[$(to)] set from storage std:vm heap[$(from)]
