#once
#include "stdlib"

// typedef struct {
//     int width;
//     int height;
//     int x;
//     int y;
//     int z;
//     int data[];
// } Screen;


// Screen *Screen_New(int width, int height, int x, int y, int z)
Screen_New:
    push r0
    push r1
    push r2
    push r3
    push r4

    // int r0;  // structSize
    mul r0, r1
    add r0, 5
    call malloc

    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    mov [rax], r0
    mov [rax + 1], r1
    mov [rax + 2], r2
    mov [rax + 3], r3
    mov [rax + 4], r4

    ret


// void Screen_Clear(Screen *screen)
Screen_Clear:
    add r0, 5
    mov r1, 0
    mov r2, [r0]
    mul r2, [r0 + 1]

    call memset
    ret


export std:_internal/screen_render_pixel:
    inline $particle trail{target: [0, -128, 0], color: $(color), duration:1} $(x) $(y) $(z)
    ret


// void Screen_Render(Screen *screen)
Screen_Render:
    // int t0;  // width
    // int t1;  // height
    // int t2;  // i
    // int t3;  // j
    // int t4;  // pixelColor
    // int t5;  // scaledX
    // int t6;  // scaledY
    // int t7;  // scaledZ
    // int t8;  // tmpX
    // int t9;  // tmpY
    // int t10;  // tmpZ (UNUSED)
    // int t11;  // data
    mov t0, [r0]
    mov t1, [r0 + 1]
    mov t5, [r0 + 2]
    mov t6, [r0 + 3]
    mov t7, [r0 + 4]
    mov t11, [r0 + 5]
    // 5x scale
    mul t5, 5
    mul t6, 5
    mul t7, 5
    
    mov t2, 0
.loopY
    mov t3, 0
.loopX
    // mov t4, [data + i * width + j]
    mov t4, t2
    mul t4, t0
    add t4, t3
    add t4, t11
    mov t4, [t4]

    // calc position (25 pixels per block, 5x scale)
    mov t8, t5
    add t8, t3

    mov t9, t6
    sub t9, t2

    // do draw
    inline data modify storage std:vm s2 set value {color: 0, x: 0.0, y: 0.0, z: 0.0}
    inline execute store result storage std:vm s2.color int 1 run scoreboard players get t4 vm_regs
    inline execute store result storage std:vm s2.x double 0.2 run scoreboard players get t8 vm_regs
    inline execute store result storage std:vm s2.y double 0.2 run scoreboard players get t9 vm_regs
    inline execute store result storage std:vm s2.z double 0.2 run scoreboard players get t7 vm_regs
    inline function std:_internal/screen_render_pixel with storage s2

    add t3, 1
    jl t3, t0, .loopX

    add t2, 1
    jl t2, t0, .loopY

    ret


// void Screen_SetPixel(Screen *screen, int x, int y, int color)
Screen_SetPixel:
    mul r1, [r0]
    add r1, r2
    mov [r0 + r1 + 5], r3
    ret
