# 函数原型：int to_char()
# to_char的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void to_char(String string)
# 调用者需要确保字符串长度为1；函数本身不会检查这点
# 当无法解析时，返回-1

data modify storage std:vm s3 set value {string: ""}
$data modify storage std:vm s3.string set from storage std:vm str_heap[$(string)]
scoreboard players set rax vm_regs -1
function std:_internal/to_char2 with storage std:vm s3
