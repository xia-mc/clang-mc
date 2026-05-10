execute store result score rax vm_regs run data get storage std:vm mcstr.next_id
scoreboard players add rax vm_regs 1
data modify storage std:vm mcstr.slots append value {value: "", refcnt: 0, next: -1, flags: 0}
execute store result storage std:vm mcstr.next_id int 1 run scoreboard players get rax vm_regs
scoreboard players remove rax vm_regs 1
