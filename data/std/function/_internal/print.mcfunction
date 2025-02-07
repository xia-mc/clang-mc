# 函数原型：void print()
# print的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void print(String string)

$data modify storage std:vm r4 set from storage std:vm str_pool[$(string)]
tellraw @a {"storage":"std:vm", "nbt":"r4"}
