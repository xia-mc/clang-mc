# 函数原型：void shrink_heap()
# shrink的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void shrink_heap(int shp)

$data remove storage std:vm heap[$(shp)]
