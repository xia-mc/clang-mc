# 函数原型：String merge_string()
# merge_string的内部实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：void merge_string(String left, String right)

data modify storage std:vm r4 set value {string: "", length: -1}

$data modify storage std:vm r4.string set from storage std:vm str_pool[$(left)]
$data modify storage std:vm r4.string append from storage std:vm str_pool[$(right)]

# 计算新的字符串长度
function std:string/get_length
scoreboard players operation t0 vm_regs = rax vm_regs
scoreboard players operation r0 vm_regs = r1 vm_regs
function std:string/get_length
scoreboard players operation t0 vm_regs += rax vm_regs
execute store result storage std:vm r4.length int 1 run scoreboard players get t0 vm_regs

function std:alloc_str with storage std:vm r4
