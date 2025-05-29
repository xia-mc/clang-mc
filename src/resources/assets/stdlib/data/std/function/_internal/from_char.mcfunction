# 函数原型：void from_char()
# from_char的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void from_char(char char)
# 调用者需要确保字符串长度为1；函数本身不会检查这点
# 当无法解析时，mcfunctions返回fail


$data modify storage std:vm s3.string set from storage std:vm char2str_map[$(char)]
