# 函数原型：int to_char2()
# to_char的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void to_char2(NBTString string)
# 调用者需要确保字符串长度为1；函数本身不会检查这点
# 当无法解析时，Minecraft函数协议返回fail，rax不会被修改

$execute store result score rax vm_regs run data get storage std:vm str2char_map[$(string)] 1
