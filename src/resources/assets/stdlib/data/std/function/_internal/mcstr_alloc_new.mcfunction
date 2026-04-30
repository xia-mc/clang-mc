execute store result score rax vm_regs run data get storage std:vm mcstr.next_id
data modify storage std:vm mcstr.slots append value {value: "", refcnt: 0, next: -1, flags: 0}
execute store result storage std:vm mcstr.next_id int 1 run data get storage std:vm mcstr.slots 1
