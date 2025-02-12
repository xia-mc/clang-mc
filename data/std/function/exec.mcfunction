# 函数原型：void exec(String code)
# 执行任意代码

data modify storage std:vm s4 set value {code: -1}
execute store result storage std:vm s4.code int 1 run scoreboard players get r0 vm_regs

function std:_internal/exec
