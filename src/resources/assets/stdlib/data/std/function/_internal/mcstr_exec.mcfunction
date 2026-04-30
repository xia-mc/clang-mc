$data modify storage std:vm s1.str set from storage std:vm mcstr.slots[$(id)].value
data modify storage std:vm s1.next set value ""
execute store result score rax vm_regs run function std:_internal/exec with storage std:vm s1
