#994e01
.globl make_block
make_block:
    sub sp, sp, 24
    str x30, [sp]

    // save the pixel base
    mov x11, x0
    str x11, [sp, 8]

    // mov x10, 3
    // save the brown color on x4
    movz x4, 0x99, lsl 16
    movk x4, 0x4e01, lsl 00
    // paint pixel
    mov x2, 1
    mov x3, 1
    bl horizontal_line
    
    mov x1, 1
    bl go_n_pixel
    bl horizontal_line
    mov x1, 1
    bl go_n_pixel
    bl horizontal_line
    mov x1, 1
    bl go_n_pixel
    bl horizontal_line

    bl go_n_pixel
    mov x2, 8
    mov x3, 8
    bl horizontal_line

    mov x1, 8
    bl go_n_pixel
    mov x2, 1
    mov x3, 1
    bl horizontal_line
    mov x1, 1
    bl go_n_pixel
    mov x2, 1
    mov x3, 1
    bl horizontal_line
    mov x1, 1
    bl go_n_pixel
    mov x2, 1
    mov x3, 1
    bl horizontal_line
    mov x1, 1
    bl go_n_pixel
    mov x2, 1
    mov x3, 1
    bl horizontal_line

    //go to base pixel
    ldr x11, [sp, 8]

    mov x0, x11
    #ffcdc5
    movz x4, 0xff, lsl 16
    movk x4, 0xcdc5, lsl 00

    mov x1, 1
    bl go_n_line

    mov x2, 1
    mov x3, 14
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x1, 13
    bl go_p_line
    
    mov x3, 12  
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x1, 11
    bl go_p_line

    mov x3, 10
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x1, 9
    bl go_p_line

    mov x3, 8
    bl horizontal_line

    #000000
    movz x4, 0x00, lsl 00
    mov x2, 9
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 11
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 13
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 15
    mov x3, 1
    bl horizontal_line

    //go to base pixel
    ldr x11, [sp, 8]
    mov x0, x11

    movz x4, 0xff, lsl 16
    movk x4, 0xcdc5, lsl 00

    mov x1, 1
    bl go_n_pixel

    mov x2, 14
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 12
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 10
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 8
    mov x3, 1
    bl horizontal_line

    //go to base pixel
    ldr x11, [sp, 8]
    mov x0, x11

    movz x4, 0x00, lsl 00

    mov x1, 15
    bl go_n_pixel

    mov x2, 1
    mov x3, 15
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x1, 14
    bl go_p_line
    
    mov x3, 13  
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x1, 12
    bl go_p_line

    mov x3, 11
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x1, 10
    bl go_p_line

    mov x3, 9
    bl horizontal_line

    ldr x30, [sp]
    add sp, sp, 24

    ret

.globl make_block_ramp
make_block_ramp:
    sub sp, sp, 32
    str x30, [sp]

    // Dirección base del framebuffer
    mov x11, x0
    str x11, [sp, 24]

    // Cantidad de bloques
    mov x9, 2
    bl make_n_blocks

    // ldr x0, [sp, 24]
    // mov x1, 16
    // bl go_n_line
    // bl go_p_pixel

    // mov x9, 3
    // bl make_n_blocks

    ldr x30, [sp]
    add sp, sp, 24
    ret

make_n_blocks:
    sub sp, sp, 48
    str x30, [sp]

    // Dirección base del framebuffer
    mov x11, x0
    str x11, [sp, 8]
    str x9, [sp, 16]
    str x11, [sp, 24]
    str x9, [sp, 40]

    mov x15, 8
    str x15, [sp, 32]

    loop:
        bl make_block

        ldr x0, [sp, 24]
        mov x1, 16
        bl go_n_pixel

        str x0, [sp, 24]

        ldr x9, [sp, 16]
        sub x9, x9, 1
        str x9, [sp, 16]

        cbnz x9, loop
    
    ldr x0, [sp, 8]
    mov x1, 16
    bl go_n_line
    bl go_p_pixel

    ldr x15, [sp, 32]
    sub x15, x15, 1
    str x15, [sp, 32]

    ldr x9, [sp, 40]
    add x9, x9, 1

    cbnz x15, loop

    ldr x30, [sp]
    add sp, sp, 40
    ret


    