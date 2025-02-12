# 函数原型：String substring(String string, int start, int end)
# 拆分字符串，start为第一个在结果字符串里的下标，end为第一个不在结果字符串里的下标；返回一个新引用
# start和end必须不越界，且end > start；函数不会检查index是否有效

data modify storage std:vm s4 set value {string: -1, start: -1, end: -1}
execute store result storage std:vm s4.string int 1 run scoreboard players get r0 vm_regs
execute store result storage std:vm s4.start int 1 run scoreboard players get r1 vm_regs
execute store result storage std:vm s4.end int 1 run scoreboard players get r2 vm_regs
function std:_internal/substring with storage std:vm s4
