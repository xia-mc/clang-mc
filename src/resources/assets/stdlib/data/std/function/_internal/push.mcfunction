# 函数原型：void push()
# push的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void push(NBTString name, int rsp)

data modify storage std:vm stack append value -1
$execute store result storage std:vm stack[$(rsp)] int 1 run scoreboard players get $(name) vm_regs
