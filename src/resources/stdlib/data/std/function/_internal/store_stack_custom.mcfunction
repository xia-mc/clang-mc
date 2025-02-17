# 函数原型：void store_stack_custom()
# 汇编器的辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void store_stack_custom(int rsp, NBTString value)

$execute store result storage std:vm stack[$(rsp)] int 1 run scoreboard players get $(value) vm_regs
