# 函数原型：String merge_string()
# merge_string的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void merge_string(String left, String right)

data modify storage std:vm s6 set value {left: "", right: ""}
$data modify storage std:vm s6.left set from storage std:vm str_heap[$(left)]
$data modify storage std:vm s6.right set from storage std:vm str_heap[$(right)]

function std:_internal/merge_string2 with storage std:vm s6
