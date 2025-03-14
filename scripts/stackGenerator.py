PUSH_TEMPLATE = """
# 函数原型：void push_%REG%()
# 把r2的值推入栈顶

scoreboard players add rsp vm_regs 1

data modify storage std:vm s2 set value {name: "%REG%", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/push with storage std:vm s2
"""

PEEK_TEMPLATE = """
# 函数原型：void peek_%REG%()
# 获取但不移除栈顶的值，存入%REG%

data modify storage std:vm s2 set value {name: "%REG%", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/peek with storage std:vm s2
"""

POP_TEMPLATE = """
# 函数原型：void pop_%REG%()
# 取出栈顶的值，存入r0

data modify storage std:vm s2 set value {name: "%REG%", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

scoreboard players remove rsp vm_regs 1
function std:_internal/pop with storage std:vm s2
"""

REGS = ["rax", "r0", "r1", "r2", "r3", "t0", "t1", "t2", "t3"]

for reg in REGS:
    with open(f"push_{reg}.mcfunction", "w", encoding="UTF-8") as f:
        f.write(PUSH_TEMPLATE.replace("%REG%", reg))
    with open(f"peek_{reg}.mcfunction", "w", encoding="UTF-8") as f:
        f.write(PEEK_TEMPLATE.replace("%REG%", reg))
    with open(f"pop_{reg}.mcfunction", "w", encoding="UTF-8") as f:
        f.write(PUSH_TEMPLATE.replace("%REG%", reg))
