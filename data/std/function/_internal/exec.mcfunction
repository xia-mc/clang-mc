# 函数原型：void exec()
# exec的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void exec(String code)

data modify storage std:vm s3 set value {code: ""}
$data modify storage std:vm s3.code set from storage std:vm str_heap[$(code)]

function std:_internal/exec2 with storage std:vm s3
