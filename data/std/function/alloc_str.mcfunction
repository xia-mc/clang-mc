# 函数原型：String alloc_str()
# 分配一个常量字符串池中的字符串，返回引用
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void alloc_str(NBTString string, int length)
# 例子：function std:alloc_str {string: "Hello, world!", length: 12}
# alloc_str不会利用缓存优化，每次调用都会创建一个新的字符串对象

$data modify storage std:vm str_pool append value $(string)
$data modify storage std:vm str_size_pool append value $(length)

scoreboard players operation rax vm_regs = rpp vm_regs
scoreboard players add rpp vm_regs 1
