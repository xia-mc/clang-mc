# 函数原型：void load_stack_custom()
# 汇编器的辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void load_stack_custom(NBTString result, int ptr)

$execute store result score $(result) vm_regs run data get storage std:vm stack[$(ptr)]
