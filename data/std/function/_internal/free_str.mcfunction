# 函数原型：void free_str()
# free_str的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void free_str(String string)

$data remove storage std:vm str_pool[$(string)]
$data remove storage std:vm str_size_pool[$(string)]
