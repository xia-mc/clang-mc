# 函数原型：String alloc_str2()
# alloc_str的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void alloc_str2(NBTString string, int length, int sap, [[maybe_unused]] int result)
# 从缓存的字符串堆可用空间里取一个
# s2寄存器有Minecarft函数入参

$execute store result score rax vm_regs run data get storage std:vm str_available_space[$(sap)]
execute store result storage std:vm s2.result int 1 run scoreboard players get rax vm_regs

$data modify storage std:vm str_heap[$(result)] set value "$(string)"
$data modify storage std:vm str_size_heap[$(result)] set value $(length)
