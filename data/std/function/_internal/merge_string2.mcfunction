# 函数原型：void merge_string2()
# merge_string的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void merge_string2(NBTString left, NBTString right)
# 会修改s3.string

$data modify storage std:vm s3.string set value "$(left)$(right)"
