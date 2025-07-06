#once

export std:_internal/print:
    inline $return run data modify storage std:vm s3.next set from storage std:vm char2str_map.$(char)
    ret


export std:_internal/print2:
    inline $return run data modify storage std:vm s3.text set value "$(text)$(next)"
    ret


// void print(const char *string)
print:
    inline data modify storage std:vm s3 set value {char: -1, text: "", next: ""}

.loop:
    mov r1, [r0]
    je r1, 0, .do_print
    inline execute store result storage std:vm s3.char int 1 run scoreboard players get r1 vm_regs
    inline function std:_internel/print with storage std:vm s3
    inline function std:_internel/print2 with storage std:vm s3
    add r0, 1

    jmp .loop

.do_print:
    inline return run tellraw @a {"storage": "std:vm", "nbt": "s3.text"}
    ret
