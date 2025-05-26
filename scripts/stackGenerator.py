PUSH_TEMPLATE = """# 不要修改此文件，该文件由脚本生成
# 函数原型：void push_%REG%()
# 把%REG%的值推入栈顶

scoreboard players remove rsp vm_regs 1

data modify storage std:vm s2 set value {name: "%REG%", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/push with storage std:vm s2
"""

PEEK_TEMPLATE = """# 不要修改此文件，该文件由脚本生成
# 函数原型：void peek_%REG%()
# 获取但不移除栈顶的值，存入%REG%

data modify storage std:vm s2 set value {name: "%REG%", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/peek with storage std:vm s2
"""

POP_TEMPLATE = """# 不要修改此文件，该文件由脚本生成
# 函数原型：void pop_%REG%()
# 把栈顶的值弹出到%REG%

scoreboard players add rsp vm_regs 1

data modify storage std:vm s2 set value {name: "%REG%", rsp: -1}
execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs

function std:_internal/pop with storage std:vm s2
"""

REGS = ["rax", "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15"]

for reg in REGS:
    with open(f"push_{reg}.mcfunction", "w", encoding="UTF-8") as f:
        f.write(PUSH_TEMPLATE.replace("%REG%", reg))
    with open(f"peek_{reg}.mcfunction", "w", encoding="UTF-8") as f:
        f.write(PEEK_TEMPLATE.replace("%REG%", reg))
    with open(f"pop_{reg}.mcfunction", "w", encoding="UTF-8") as f:
        f.write(POP_TEMPLATE.replace("%REG%", reg))
