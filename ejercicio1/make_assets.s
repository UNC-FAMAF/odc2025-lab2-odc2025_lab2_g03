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
    sub sp, sp, 8
    str x30, [sp]

    // Cantidad de bloques
    mov x9, 2
    bl make_n_blocks

    mov x9, 3
    bl make_n_blocks

    mov x9, 4
    bl make_n_blocks

    mov x9, 5
    bl make_n_blocks

    mov x9, 6
    bl make_n_blocks

    mov x9, 7
    bl make_n_blocks

    mov x9, 8
    bl make_n_blocks

    mov x9, 9
    bl make_n_blocks

    bl test_line

    ldr x30, [sp]
    add sp, sp, 8
    ret

make_n_blocks:
    sub sp, sp, 32
    str x30, [sp]

    // Dirección base del framebuffer
    mov x11, x0
    str x11, [sp, 8]
    str x9, [sp, 16]
    str x11, [sp, 24]

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

    ldr x30, [sp]
    add sp, sp, 32
    ret
    
#994E00
.globl make_block_castel
    make_block_castel:
    sub sp, sp, 8
    str x30, [sp]

	//Fondo Ladrillo

	mov x0, x20
	ADD	x0, x0, 200  //corre el inicio del pixel

	mov x7, x0 // El pixel del Bloque

	mov x2, 17 // Ancho

	mov x3, 15 // Alto

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	// Pinto lo negro

	MOV	x0, x7

	MOV	x2, 1

	MOV	x3, 15

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line  

	MOV x1, 12

	BL go_p_line

	MOV	x2, 17

	MOV	x3, 1

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 4

	BL go_p_line

	MOV x1, 8

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 3

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 3

	BL go_p_line

	MOV x1, 8

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 3

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 12

	BL go_p_pixel

	MOV	x2, 1

	MOV	x3, 5

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 4

	BL go_p_line

	MOV x1, 8

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 4

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 1

	BL go_p_line

	MOV x1, 12

	BL go_p_pixel

	MOV	x2, 17

	MOV	x3, 1

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line	

	MOV x1, 3

	BL go_n_line

	MOV	x2, 17

	MOV	x3, 1

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line	

	MOV x1, 4

	BL go_p_line

	MOV x1, 8

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 3

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line	

	MOV x1, 3

	BL go_p_line

	MOV x1, 8

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 3

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 4

	BL go_n_line

	MOV x1, 16

	BL go_p_pixel

	MOV	x2, 17

	MOV	x3, 1

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 4

	BL go_p_line

	MOV x1, 4

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 3

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

	MOV x1, 3

	BL go_p_line

	MOV x1, 8

	BL go_n_pixel

	MOV	x2, 1

	MOV	x3, 3

	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

    ldr x30, [sp]
    add sp, sp, 8
    ret
    
