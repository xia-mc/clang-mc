# 函数原型：void free_str(String string)
# free_str的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void free_str(int sap)

$execute store result storage std:vm str_available_space[$(sap)] int 1 run scoreboard players get r0 vm_regs
