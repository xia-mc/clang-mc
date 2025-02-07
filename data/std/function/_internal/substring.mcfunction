# 函数原型：String substring()
# substring的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void substring(String string, int start, int end)

data modify storage std:vm r4 set value {string: "", length: -1}

$data modify storage std:vm r4.string append string storage std:vm str_pool[$(string)] $(start) $(end)
$data modify storage std:vm r4.length set value $(end) - $(start)

function std:alloc_str with storage std:vm r4
# 此时rax为结果
