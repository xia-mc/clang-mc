# 函数原型：String substring()
# substring的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void substring(String string, int start, int end)

data modify storage std:vm s3 set value {string: "", length: -1}

$data modify storage std:vm s3.string set string storage std:vm str_heap[$(string)] $(start) $(end)
$scoreboard players set t3 vm_regs $(end)
$scoreboard players remove t3 vm_regs $(start)
execute store result storage std:vm s3.length int 1 run scoreboard players get t3 vm_regs

function std:string/alloc_str with storage std:vm s3
# 此时rax为结果
