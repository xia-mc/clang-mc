# 函数原型：void push_zero()
# push_zero的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void push_zero(int rsp)

$data modify storage std:vm heap[$(rsp)] set value 0
