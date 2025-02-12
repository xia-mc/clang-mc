# 函数原型：void print_string()
# print的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void print_string(String string)

$tellraw @a {"storage":"std:vm", "nbt":"str_heap[$(string)]"}
