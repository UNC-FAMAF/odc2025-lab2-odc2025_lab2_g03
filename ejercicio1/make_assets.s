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
.globl make_block_castle
    make_block_castle:
    sub sp, sp, 8
    str x30, [sp]

    MOV	x7, x0
	//Fondo Ladrillo
    mov x2, 17 // Ancho

	mov x3, 15 // Alto

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

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
    
make_n_blocks_castle:
    sub sp, sp, 32
    str x30, [sp]

    // Dirección base del framebuffer
    mov x11, x0
    str x11, [sp, 8]
    str x9, [sp, 16]
    str x11, [sp, 24]

    loop_castle:
        bl make_block_castle

        ldr x0, [sp, 24]
        mov x1, 17
        bl go_n_pixel

        str x0, [sp, 24]

        ldr x9, [sp, 16]
        sub x9, x9, 1
        str x9, [sp, 16]

        cbnz x9, loop_castle

    ldr x0, [sp, 8]
    mov x1, 15
    bl go_n_line

    mov x1, 17
    bl go_p_pixel

    ldr x30, [sp]
    add sp, sp, 32
    ret

    .globl make_block_castle_2
make_block_castle_2:

    SUB	 sp, sp, 8 
    STR	 x30,[sp]

	mov x1, 40 

	BL	go_n_line

	mov x2, 4

	mov x3, 7

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

	MOV	x1, 7

	BL go_p_line


	mov x2, 4

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	MOV	x1, 3

	BL go_n_pixel


	mov x2, 1

	mov x3, 7

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	mov x2, 7

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	MOV	x1, 9

	BL go_p_line

	MOV	x1, 7

	BL go_n_pixel

	mov x2, 1

	mov x3, 9

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line	

	MOV	x1, 9

	BL go_p_line

	MOV	x1, 1

	BL go_n_pixel

	mov x2, 7

	mov x3, 7

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

	MOV	x1, 7

	BL go_p_line

	MOV	x1, 1

	BL go_p_pixel

	mov x2, 8

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line	

	MOV	x1, 1

	BL go_p_line

	MOV	x1, 8 

	BL go_n_pixel

	mov x2, 1

	mov x3, 9

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line	

	//Prueba

	MOV	x1, 1 

	BL	go_p_line

	mov x2, 7

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	MOV	x1, 9

	BL go_p_line

	MOV	x1, 7

	BL go_n_pixel

	mov x2, 1

	mov x3, 9

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line	

	MOV	x1, 9

	BL go_p_line

	MOV	x1, 1

	BL go_n_pixel

	mov x2, 7

	mov x3, 7

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

	MOV	x1, 7

	BL go_p_line

	MOV	x1, 1

	BL go_p_pixel

	mov x2, 8

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line	

	MOV	x1, 1

	BL go_p_line

	MOV	x1, 8 

	BL go_n_pixel

	mov x2, 1

	mov x3, 9

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	MOV	x1, 1

	BL go_p_line

	mov x2, 7

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	MOV	x1, 8

	BL go_p_line

	MOV	x1, 8 

	BL go_n_pixel

	mov x2, 3

	mov x3, 7

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

	MOV	x1, 8

	BL go_p_line

	MOV	x1,1 

	BL go_p_pixel

	mov x2, 1

	mov x3, 9

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

	MOV	x1, 9

	BL go_p_line

	MOV	x1,1 

	BL go_n_pixel

	mov x2, 3

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

    LDR	 x30,[sp]   
    ADD	 sp, sp, 8

    RET

    make_n_blocks_castle_2 :
    sub sp, sp, 32
    str x30, [sp]

    // Dirección base del framebuffer
    mov x11, x0
    str x11, [sp, 8]
    str x9, [sp, 16]
    str x11, [sp, 24]

    loop_castle_2:
        bl make_block_castle_2

        ldr x0, [sp, 24]
        mov x1, 17
        bl go_n_pixel

        str x0, [sp, 24]

        ldr x9, [sp, 16]
        sub x9, x9, 1
        str x9, [sp, 16]

        cbnz x9, loop_castle_2

    ldr x0, [sp, 8]
    mov x1, 15
    bl go_n_line

    mov x1, 17
    bl go_p_pixel

    ldr x30, [sp]
    add sp, sp, 32
    ret


.globl make_castle
make_castle:

    SUB	 sp, sp, 8 
    STR	 x30,[sp]
    
    mov x9, 3
    BL make_n_blocks_castle

    mov x1 , 1

    BL go_n_line

    mov x1, 17

    BL go_n_pixel

    mov x9, 3
    BL make_n_blocks_castle

    MOV	 x1, 1

    BL go_n_line

    MOV	 x1, 1

    BL go_p_pixel

    mov x9, 5
    BL make_n_blocks_castle   

    MOV	 x1, 1

    BL go_n_line

    MOV	 x1, 17

    BL go_n_pixel 

    mov x9, 5
    BL make_n_blocks_castle  

    MOV	 x1, 1

    BL go_n_line

    MOV	 x1, 17

    BL go_n_pixel 

    mov x9, 5
    BL make_n_blocks_castle   

    MOV	 x1, 1

    BL go_n_line 

    MOV	 x1, 17

    BL go_n_pixel 

    mov x9, 5
    BL make_n_blocks_castle

    mov x1, 144

    BL go_p_line

    MOV	x1, 38

    BL go_n_pixel 

    mov x9, 1

    BL make_block_castle_2    

    mov x1, 44

    BL go_p_pixel

    mov x2, 4

	mov x3, 7

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

    MOV	x1, 1

    BL go_p_line 

    MOV	x1, 4

    BL go_n_pixel 

    mov x2, 2

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

    mov x1, 4

    BL go_p_pixel

    mov x2, 6

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

    mov x1, 9

    BL go_p_line

    mov x2, 6

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

    MOV	 x1, 6 

    BL go_n_line

    MOV	 x1, 14 

    BL go_n_pixel

    mov x2, 7

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

    mov x2, 7

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line

    MOV	 x1, 2 

    BL go_p_line

    MOV	 x1, 15 

    BL go_n_pixel

    mov x2, 7

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line 

    mov x2, 7

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line

    MOV	 x1, 1 

    BL go_p_line

    MOV	 x1, 15 

    BL go_n_pixel

    mov x2, 7

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line

    MOV	x1, 8 

    BL go_p_line

    mov x1, 3

    BL go_n_pixel

    mov x2, 4

	mov x3, 7

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

    mov x1, 8

    BL go_p_line

    mov x2, 4

	mov x3, 1

	movz x4, 0xFF, lsl 16	
	movk x4, 0xCCC5, lsl 00 

	BL horizontal_line

        mov x1, 9

    BL go_p_line

    MOV	x1, 65

    BL go_p_pixel 

    mov x9, 1

    BL make_block_castle_2   

    mov x1, 41

    BL go_p_line

    mov x9, 1

    BL make_block_castle_2

    MOV	 x1, 6 

    BL go_n_line

    MOV	 x1, 82

    BL go_p_pixel

    mov x2, 3

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line

    mov x2, 3

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line
    
    MOV	 x1, 2 

    BL go_p_line

    MOV	x1, 11

    BL go_n_pixel 

    mov x2, 7

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line 

    mov x2, 7

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line 

    MOV	 x1, 2 

    BL go_p_line

    MOV	x1, 15

    BL go_n_pixel 

    mov x2, 7

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line 

    MOV	x1, 1

    BL go_p_line

    MOV	x1, 26

    BL go_n_pixel 

    mov x2, 7

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line 

    MOV	 x1, 1 

    BL go_p_line

    MOV	x1, 15

    BL go_n_pixel 

    mov x2, 7

	mov x3, 1

	movz x4, 0x99, lsl 16	
	movk x4, 0x4E00, lsl 00 

	BL horizontal_line 

    mov x2, 7

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line 

    mov x1, 1

    BL go_p_line

    mov x1, 15 

    BL go_n_pixel

    mov x2, 3

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line 

    MOV	x1, 25

    BL go_p_line 

    MOV	x1, 55

    BL go_p_pixel

    mov x2, 8

	mov x3, 16

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line 

    MOV	x1, 16

    BL go_p_line 

    MOV	x1, 25

    BL go_n_pixel

    mov x2, 9

	mov x3, 16

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

	BL horizontal_line 

    // Puertas

    MOV	x1, 17

    BL go_n_line 

    MOV	x1, 12

    BL go_p_pixel

    mov x2, 6

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line 

    MOV	x1, 2

    BL go_p_pixel

    mov x2, 10

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line 

    MOV	x1, 1

    BL go_p_pixel

    mov x2, 12

	mov x3, 1

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line 

    MOV	x1, 1

    BL go_p_pixel

    mov x2, 14

	mov x3, 3

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line 

    MOV	x1, 1

    BL go_p_pixel

    mov x2, 16

	mov x3, 26

	movz x4, 0x00, lsl 16	
	movk x4, 0x0000, lsl 00 

    BL horizontal_line 


    LDR	 x30,[sp]   
    ADD	 sp, sp, 8

    RET

    .globl make_floor_block
make_floor_block:
    sub sp, sp, 16
    str x30, [sp]
    str x0, [sp, 8]

    #fbcac4
    movz x4, 0xfb, lsl 16
    movk x4, 0xcac4, lsl 00

    mov x2, 16
    mov x3, 16
    bl horizontal_line

    #924e07
    ldr x0, [sp, 8]
    movz x4, 0x92, lsl 16
    movk x4, 0x4e07, lsl 00

    mov x2, 1
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_p_line
    mov x1, 10
    bl go_n_pixel

    bl horizontal_line

    mov x1, 1
    bl go_p_line
    mov x1, 5
    bl go_n_pixel

    bl horizontal_line

    mov x1, 4
    bl go_n_line

    bl horizontal_line

    mov x1, 9
    bl go_n_line

    bl horizontal_line

    mov x1, 1
    bl go_p_line

    mov x1, 8
    bl go_p_pixel

    bl horizontal_line

    mov x1, 1
    bl go_p_line

    mov x1, 7
    bl go_p_pixel

    bl horizontal_line

    ldr x0, [sp, 8]

    mov x1, 1
    bl go_n_pixel
    bl go_n_line

    mov x2, 8
    mov x3, 9
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 6
    mov x3, 1
    bl horizontal_line

    mov x1, 2
    bl go_n_pixel

    mov x2, 4
    bl horizontal_line

    mov x1, 3
    bl go_p_pixel

    mov x2, 1
    bl horizontal_line

    mov x2, 3
    bl horizontal_line

    mov x2, 6
    bl horizontal_line

    ldr x0, [sp, 8]
    
    mov x1, 11
    bl go_n_pixel
    mov x1, 1
    bl go_n_line

    mov x2, 4
    mov x3, 3
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 3
    mov x3, 1
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_line
    bl go_n_pixel

    mov x2, 4
    mov x3, 3
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 5
    mov x3, 2
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 6
    mov x3, 2
    bl horizontal_line

    mov x2, 5
    mov x3, 1
    bl horizontal_line

    ldr x0, [sp, 8]

    mov x1, 9
    bl go_n_pixel

    movz x4, 0x00, lsl 00

    mov x2, 1
    mov x3, 10
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x3, 2
    bl horizontal_line

    mov x1, 4
    bl go_p_pixel

    mov x2, 4
    mov x3, 1
    bl horizontal_line

    mov x1, 2
    bl go_p_line
    bl go_p_pixel

    mov x2, 2
    bl horizontal_line

    mov x1, 2
    bl go_p_line
    bl go_p_pixel

    mov x2, 2
    bl horizontal_line

    ldr x0, [sp, 8]

    mov x1, 15
    bl go_n_pixel
    mov x1, 1
    bl go_n_line

    mov x2, 1
    mov x3, 4
    bl horizontal_line

    mov x1, 1
    bl go_n_line

    mov x2, 1
    mov x3, 9
    bl horizontal_line

    mov x1, 1
    bl go_p_line
    bl go_p_pixel

    mov x3, 2
    bl horizontal_line

    mov x1, 1
    bl go_p_line
    mov x1, 5
    bl go_p_pixel

    mov x2, 5
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_p_line
    mov x1, 8
    bl go_p_pixel

    mov x2, 6
    mov x3, 1
    bl horizontal_line

    ldr x30, [sp]
    add sp, sp, 16
    ret

.globl make_floor
make_floor:
    sub sp, sp, 32
    str x30, [sp]

    mov x9, 40
    bl make_n_blocks_floor
    mov x9, 40
    bl make_n_blocks_floor
    mov x9, 40
    bl make_n_blocks_floor

    ldr x30, [sp]
    add sp, sp, 32
    ret

make_n_blocks_floor:
    sub sp, sp, 32
    str x30, [sp]

    // Dirección base del framebuffer
    mov x11, x0
    str x11, [sp, 8]
    str x9, [sp, 16]
    str x11, [sp, 24]

    loop_floor:
        bl make_floor_block

        ldr x0, [sp, 24]
        mov x1, 16
        bl go_n_pixel

        str x0, [sp, 24]

        ldr x9, [sp, 16]
        sub x9, x9, 1
        str x9, [sp, 16]

        cbnz x9, loop_floor

    ldr x0, [sp, 8]
    mov x1, 16
    bl go_n_line

    ldr x30, [sp]
    add sp, sp, 32
    ret
    .globl make_cloud
make_cloud:
    sub sp, sp, 16
    str x30, [sp]
    str x0, [sp, 8]

    movz x4, 0x00, lsl 00

    mov x2, 4
    mov x3, 1
    bl horizontal_line
    
    mov x1, 1
    bl go_p_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 9
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 10
    bl horizontal_line

    mov x2, 11
    bl horizontal_line

    mov x2, 14
    bl horizontal_line

    bl go_p_pixel

    mov x2, 15
    bl horizontal_line

    bl go_p_pixel

    mov x2, 16
    bl horizontal_line

    mov x1, 3
    bl go_p_pixel

    mov x2, 19
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 21
    bl horizontal_line

    bl go_p_pixel

    mov x2, 26
    bl horizontal_line
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 32
    mov x3, 2
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 30
    mov x3, 1
    bl horizontal_line

    bl go_n_pixel

    mov x2, 28
    bl horizontal_line

    bl go_n_pixel
    
    bl horizontal_line

    bl go_n_pixel

    bl horizontal_line

    bl horizontal_line

    bl go_n_pixel

    mov x2, 26
    bl horizontal_line

    mov x1, 3
    bl go_n_pixel

    mov x2, 21
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 1
    bl go_p_line
    mov x1, 7
    bl go_n_pixel

    mov x2, 8
    bl horizontal_line

    mov x1, 2
    bl go_n_pixel

    mov x2, 4
    bl horizontal_line

    mov x1, 2
    bl go_p_line

    mov x1, 7
    bl go_n_pixel

    mov x2, 2
    bl horizontal_line

    // restore the initial cloud pixel.
    ldr x0, [sp, 8]

    movz x4, 0xff, lsl 16
    movk x4, 0xffff, lsl 00

    mov x1, 1
    bl go_n_line

    mov x2, 4
    mov x3, 1
    bl horizontal_line

    bl go_p_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 8
    bl horizontal_line

    mov x2, 9
    bl horizontal_line

    mov x2, 12
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 13
    bl horizontal_line

    bl go_p_pixel

    mov x2, 14
    bl horizontal_line

    bl go_p_pixel

    mov x2, 16
    bl horizontal_line

    mov x1, 3
    bl go_p_pixel

    mov x2, 19
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 21
    bl horizontal_line

    bl go_p_pixel

    mov x2, 25
    bl horizontal_line

    mov x2, 26
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 30
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 28
    mov x3, 1
    bl horizontal_line

    bl go_n_pixel

    mov x2, 26
    bl horizontal_line

    bl go_n_pixel

    bl horizontal_line

    bl go_n_pixel

    mov x3, 2
    bl horizontal_line

    mov x1, 3
    bl go_n_pixel

    mov x2, 21
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 1
    bl go_p_line

    mov x1, 7
    bl go_n_pixel

    mov x2, 8
    bl horizontal_line

    mov x1, 2
    bl go_n_pixel

    mov x2, 4
    bl horizontal_line

    bl go_p_line

    mov x1, 7
    bl go_n_pixel

    mov x2, 1
    bl horizontal_line

    // go to initial pixel
    ldr x0, [sp, 8]

    #76aaff
    movz x4, 0x76, lsl 16
    movk x4, 0xaaff, lsl 00

    mov x1, 5
    bl go_n_line
    mov x1, 3
    bl go_n_pixel

    mov x2, 1
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    bl horizontal_line

    mov x1, 5
    bl go_p_pixel
    mov x1, 1
    bl go_p_line

    mov x2, 2
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 1
    bl horizontal_line

    mov x1, 5
    bl go_n_line
    mov x1, 4
    bl go_p_pixel

    mov x2, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    bl horizontal_line

    bl go_n_pixel

    mov x2, 4
    bl horizontal_line

    mov x1, 3
    bl go_n_pixel

    mov x2, 12
    bl horizontal_line

    mov x1, 2
    bl go_n_pixel

    mov x2, 2
    bl horizontal_line

    mov x1, 1
    bl go_p_line

    mov x1, 6
    bl go_n_pixel

    mov x2, 3
    bl horizontal_line

    ldr x0, [sp, 8]

    mov x1, 14
    bl go_n_line
    mov x1, 3
    bl go_p_pixel

    mov x2, 1
    bl horizontal_line

    ldr x30, [sp]
    ret
    
.globl make_arbusto
make_arbusto:
    sub sp, sp, 16
    str x30, [sp]
    str x0, [sp, 8]
    #219700
    movz x4, 0x00, lsl 00

    mov x2, 4
    mov x3, 1
    bl horizontal_line
    
    mov x1, 1
    bl go_p_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 9
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 10
    bl horizontal_line

    mov x2, 11
    bl horizontal_line

    mov x2, 14
    bl horizontal_line

    bl go_p_pixel

    mov x2, 15
    bl horizontal_line

    bl go_p_pixel

    mov x2, 16
    bl horizontal_line

    mov x1, 3
    bl go_p_pixel

    mov x2, 19
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 21
    bl horizontal_line

    bl go_p_pixel

    mov x2, 26
    bl horizontal_line
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 32
    mov x3, 2
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 30
    mov x3, 1
    bl horizontal_line

    bl go_n_pixel

    mov x2, 28
    bl horizontal_line

    bl go_n_pixel
    
    bl horizontal_line

    bl go_n_pixel

    bl horizontal_line

    bl horizontal_line

    bl go_n_pixel

    mov x2, 26
    bl horizontal_line

    mov x1, 3
    bl go_n_pixel

    mov x2, 21
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 1
    bl go_p_line
    mov x1, 7
    bl go_n_pixel

    mov x2, 8
    bl horizontal_line

    mov x1, 2
    bl go_n_pixel

    mov x2, 4
    bl horizontal_line

    mov x1, 2
    bl go_p_line

    mov x1, 7
    bl go_n_pixel

    mov x2, 2
    bl horizontal_line

    // restore the initial cloud pixel.
    ldr x0, [sp, 8]

    movz x4, 0x21, lsl 16
    movk x4, 0x9700, lsl 00

    mov x1, 1
    bl go_n_line

    mov x2, 4
    mov x3, 1
    bl horizontal_line

    bl go_p_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 2
    bl go_p_pixel

    mov x2, 8
    bl horizontal_line

    mov x2, 9
    bl horizontal_line

    mov x2, 12
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 13
    bl horizontal_line

    bl go_p_pixel

    mov x2, 14
    bl horizontal_line

    bl go_p_pixel

    mov x2, 16
    bl horizontal_line

    mov x1, 3
    bl go_p_pixel

    mov x2, 19
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 21
    bl horizontal_line

    bl go_p_pixel

    mov x2, 25
    bl horizontal_line

    mov x2, 26
    bl horizontal_line

    mov x1, 1
    bl go_p_pixel

    mov x2, 30
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 28
    mov x3, 1
    bl horizontal_line

    bl go_n_pixel

    mov x2, 26
    bl horizontal_line

    bl go_n_pixel

    bl horizontal_line

    bl go_n_pixel

    mov x3, 2
    bl horizontal_line

    mov x1, 3
    bl go_n_pixel

    mov x2, 21
    mov x3, 1
    bl horizontal_line

    mov x1, 1
    bl go_n_pixel

    mov x2, 6
    bl horizontal_line

    mov x1, 1
    bl go_p_line

    mov x1, 7
    bl go_n_pixel

    mov x2, 8
    bl horizontal_line

    mov x1, 2
    bl go_n_pixel

    mov x2, 4
    bl horizontal_line

    bl go_p_line

    mov x1, 7
    bl go_n_pixel

    mov x2, 1
    bl horizontal_line

    // go to initial pixel
    ldr x0, [sp, 8]

    #76aaff
    movz x4, 0x00, lsl 00

    mov x1, 5
    bl go_n_line
    mov x1, 3
    bl go_n_pixel

    ldr x30, [sp]
    ret
