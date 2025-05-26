# 函数原型：void push()
# push的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void push(NBTString name, int rsp)

$execute store result storage std:vm heap[$(rsp)] int 1 run scoreboard players get $(name) vm_regs
