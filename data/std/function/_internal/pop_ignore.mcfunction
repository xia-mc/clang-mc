# 函数原型：void pop_ignore()
# pop的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void pop(int rsp)

$data remove storage std:vm stack[$(rsp)]
