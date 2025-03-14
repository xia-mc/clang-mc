# 函数原型：String merge_string(String left, String right)
# 拼接两个字符串，返回一个新引用

data modify storage std:vm s5 set value {left: -1, right: -1}
execute store result storage std:vm s5.left int 1 run scoreboard players get r0 vm_regs
execute store result storage std:vm s5.right int 1 run scoreboard players get r1 vm_regs

data modify storage std:vm s3 set value {string: "", length: -1}

function std:_internal/merge_string with storage std:vm s5

# 计算新的字符串长度；get_length会修改s3
data modify storage std:vm s5 set from storage std:vm s3
function std:string/get_length
scoreboard players operation t0 vm_regs = rax vm_regs
scoreboard players operation r0 vm_regs = r1 vm_regs
function std:string/get_length
scoreboard players operation t0 vm_regs += rax vm_regs
execute store result storage std:vm s5.length int 1 run scoreboard players get t0 vm_regs

function std:string/alloc_str with storage std:vm s5
