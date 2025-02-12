# 函数原型：void pop()
# pop的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void pop(NBTString name, int rsp)

$execute store result score $(name) vm_regs run data get storage std:vm stack[$(rsp)]
$data remove storage std:vm stack[$(rsp)]
