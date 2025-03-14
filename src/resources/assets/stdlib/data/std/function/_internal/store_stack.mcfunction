# 函数原型：void store_stack([[maybe_unused]] int index, int value)
# stack/store的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void store_stack(int rsp)

$execute store result storage std:vm stack[$(rsp)] int 1 run scoreboard players get r1 vm_regs
