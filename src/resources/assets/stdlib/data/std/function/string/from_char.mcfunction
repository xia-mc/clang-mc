# 函数原型：String from_char(char c)
# 把char转换成单字符字符串
# 当无法解析时，返回?

data modify storage std:vm s3 set value {char: -1, string: "?", length: 1}
execute store result storage std:vm s3.char int 1 run scoreboard players get r0 vm_regs
function std:_internal/from_char with storage std:vm s3
function std:string/alloc_str with storage std:vm s3
