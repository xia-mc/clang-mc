# 函数原型：int load_heap()
# heap/load的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void load_heap(int ptr)

$execute store result score rax vm_regs run data get storage std:vm heap[$(ptr)]
