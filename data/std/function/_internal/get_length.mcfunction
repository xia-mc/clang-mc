# 函数原型：int get_length()
# get_length的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void get_length(String string)

$execute store result score rax vm_regs run data get storage std:vm str_size_pool[$(string)]
