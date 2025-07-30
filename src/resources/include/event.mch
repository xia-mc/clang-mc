#once

#define Event_Unreg_TICK(labelName) inline schedule clear std:_internal/_wrapper_labelName

#define Event_Reg_TICK(labelName) \
    #push line \
    #push label \
    inline schedule function std:_internal/_wrapper_labelName 1t \
    jmp after \
export std:_internal/_wrapper_labelName: \
    inline schedule function std:_internal/_wrapper_labelName 1t \
    jmp labelName \
after: \
    #pop label \
    #pop line
