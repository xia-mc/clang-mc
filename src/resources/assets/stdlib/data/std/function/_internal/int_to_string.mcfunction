# 函数原型：String int_to_string()
# int/to_string的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void int_to_string(int value)

$data modify storage std:vm s3.string set value "$(value)"
