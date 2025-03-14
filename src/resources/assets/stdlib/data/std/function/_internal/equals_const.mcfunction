# 函数原型：bool equals_const(NBTCompound<NBTString> map)
# 内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void equals(NBTString left, NBTString right)
# 调用者需要确保Minecraft函数传入的storage与函数参数的storage是同一个

scoreboard players set rax vm_regs 0
$execute if data storage std:vm s4{left: $(left), right: $(right)} run scoreboard players set rax vm_regs 1
