    .globl horizontal_line
    .globl go_n_pixel
    .globl go_p_pixel_sup
    .globl delay_loop

/* ARGS:
x2: Width for the line.
x3: Height for the line.
x4: Color for the line.
*/
.globl make_rect
make_rect:
    sub sp, sp, 16
    str x30, [sp]

    mov x15, x2
    mov x16, x3
    mov x17, x0

    mov x3, 1
    bl horizontal_line
    
    mov x1, 1
    bl go_p_line

    mov x3, x16
    mov x2, 1
    bl horizontal_line

    bl go_p_line

    mov x2, x15
    mov x3, 1
    bl horizontal_line

    bl go_p_line

    mov x1, x15
    sub x1, x1, 1
    bl go_n_pixel

    mov x1, x16
    sub x1, x1, 1

    bl go_p_line
    
    mov x2, 1
    mov x3, x16
    bl horizontal_line

    ldr x30, [sp]
    add sp, sp, 16

    ret

/* ARGS:
x2: Width for the line.
x3: Height for the line.
x4: Color for the line.
*/
horizontal_line:
    sub sp, sp, 16
    str x30, [sp]

    mov x10, x3

    set_width:
        mov x9, x2
    
    paint_line:
        stur w4, [x0] // Paint the x0 pixel.
        add x0, x0, 4 // Go to the next pixel.
        sub x9, x9, 1 // Substract one pixel for paint.
        cbnz x9, paint_line // If the width doesn't zero, continue painting.
        sub x10, x10, 1 // Substract one pixel height paint.
        // Set the pixel inmedietaly bottom for start the next line (if exists).
        mov x11, 640
        mov x12, 4
        mul x11, x11, x12
        add x0, x0, x11
        add x11, xzr, x2
        mul x11, x11, x12
        sub x0, x0, x11
        cbnz x10, set_width // If the height of the line is greater than zero, continue painting.

        ldr x30, [sp]
        add sp, sp, 16

        ret

/* ARGS:
x2: Width for the line.
x3: Height for the line.
x4: Color for the line.
x7: Pix x Pix modify. (Example -> (x2 * x7) x (x3 * x7) total pixels.)
*/
.globl line_sup
line_sup:
    sub sp, sp, 24
    str x30, [sp]
    str x2, [sp, 8]
    str x3, [sp, 16]

    mul x2, x2, x7
    mul x3, x3, x7

    mov x10, x3

    set_width_ls:
        mov x9, x2
    
    paint_line_ls:
        stur w4, [x0] // Paint the x0 pixel.
        add x0, x0, 4 // Go to the next pixel.
        sub x9, x9, 1 // Substract one pixel for paint.
        cbnz x9, paint_line_ls // If the width doesn't zero, continue painting.
        sub x10, x10, 1 // Substract one pixel height paint.
        // Set the pixel inmedietaly bottom for start the next line (if exists).
        mov x11, 640
        mov x12, 4
        mul x11, x11, x12
        add x0, x0, x11
        add x11, xzr, x2
        mul x11, x11, x12
        sub x0, x0, x11
        cbnz x10, set_width_ls // If the height of the line is greater than zero, continue painting.

        ldr x30, [sp]
        ldr x2, [sp, 8]
        ldr x3, [sp, 16]
        add sp, sp, 16

        ret

/* ARGS: 
x1: Num for go line.
*/
.globl go_n_line
go_n_line:
    sub sp, sp, 16
    str x30, [sp]
    str x1, [sp, 8]

    mov x11, 640
    mov x12, 4
    mul x11, x11, x12
    mul x11, x11, x1
    add x0, x0, x11

    ldr x30, [sp]
    ldr x1, [sp, 8]
    // Free stack-pointer memory.
    add sp, sp, 16

    ret
/* ARGS: 
x1: Num for go line.
*/
.globl go_p_line
go_p_line:
    sub sp, sp, 16
    str x30, [sp]
    str x1, [sp, 8]

    mov x11, 640
    mov x12, 4
    mul x11, x11, x12
    mul x11, x11, x1
    sub x0, x0, x11

    ldr x30, [sp]
    ldr x1, [sp, 8]
    // Free stack-pointer memory.
    add sp, sp, 16

    ret

/* ARGS:
x1: Num for go to pixel.
*/
.globl go_p_pixel
go_p_pixel:
    mov x5, 4
    mul x5, x5, x1
    sub x0, x0, x5

    ret

/* ARGS:
x1: Num for go to pixel.
*/
go_n_pixel:
    mov x5, 4
    mul x5, x5, x1
    add x0, x0, x5

    ret

/* ARGS:
x1: The x1 ms to set the delay
*/
delay_loop:
    sub x1, x1, 1
    cbnz x1, delay_loop
    ret

/* ARGS: 
x1: Num for go line.
*/
.globl go_n_line_sup
go_n_line_sup:
    sub sp, sp, 16
    str x30, [sp]
    str x1, [sp, 8]

    mul x1, x1, x7

    mov x11, 640
    mov x12, 4
    mul x11, x11, x12
    mul x11, x11, x1
    add x0, x0, x11

    ldr x30, [sp]
    ldr x1, [sp, 8]
    // Free stack-pointer memory.
    add sp, sp, 16

    ret
/* ARGS: 
x1: Num for go line.
*/
.globl go_p_line_sup
go_p_line_sup:
    sub sp, sp, 16
    str x30, [sp]
    str x1, [sp, 8]

    mul x1, x1, x7

    mov x11, 640
    mov x12, 4
    mul x11, x11, x12
    mul x11, x11, x1
    sub x0, x0, x11

    ldr x30, [sp]
    ldr x1, [sp, 8]
    // Free stack-pointer memory.
    add sp, sp, 16

    ret

/* ARGS:
x1: Num for go to pixel.
*/
go_p_pixel_sup:
    sub sp, sp, 16
    str x30, [sp]
    str x1, [sp, 8]

    mul x1, x1, x7

    mov x5, 4
    mul x5, x5, x1
    sub x0, x0, x5

    ldr x30, [sp]
    ldr x1, [sp, 8]
    add sp, sp, 16

    ret

/* ARGS:
x1: Num for go to pixel.
*/
.globl go_n_pixel_sup
go_n_pixel_sup:
    sub sp, sp, 16
    str x30, [sp]
    str x1, [sp, 8]

    mul x1, x1, x7

    mov x5, 4
    mul x5, x5, x1
    add x0, x0, x5

    ldr x30, [sp]
    ldr x1, [sp, 8]
    add sp, sp, 16

    ret


.globl test_line
test_line:
    sub sp, sp, 16
    str x30, [sp]
    str x4, [sp, 8]

    movz x4, 0xFF, lsl 16
    movk x4, 0xFFFF, lsl 00

    mov x2, 7
    mov x3, 1
    bl horizontal_line

    str x30, [sp]
    str x4, [sp, 8]
    add sp, sp, 16

    ret

    .globl make_mario
make_mario:

	SUB	sp, sp, 8 
	STR x30, [sp]  
	
	mov x0, x20
	ADD	x0, x0, 640  //corre el inicio del pixel

	mov x7, x0 // El pixel de inicio de Mario

	//Gorra De Mario

	mov x2, 12

	mov x3, 2

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	SUB	x0,x0,8

	mov x2, 20

	mov x3, 2

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line
	
	// Piel de Mario

	mov x2, 16

	mov x3, 2

	movz x4, 0xF6, lsl 16
	movk x4, 0x9534, lsl 00 

	BL horizontal_line

	SUB	 x0,x0,8 

	mov x2, 22

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line 

	mov x2, 24

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line

	mov x2, 22

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line 

	ADD	 x0,x0,8 

	mov x2, 16

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line 

	SUB	x0,x0,8 

	mov x2, 16

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line

	SUB	x0,x0,8 

	mov x2, 22

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line 

	SUB	x0,x0,8 

	mov x2, 26

	mov x3, 8

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line 

	// Piernas

	ADD	x0,x0, 16 

	mov x2, 8

	mov x3, 2

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 10
	BL go_n_pixel

	mov x2, 8

	mov x3, 2

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	SUB	x0,x0, 48

	mov x2, 8

	mov x3, 2

	//Zapatillas

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 14
	BL go_n_pixel

	mov x2, 8

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line
	
	SUB	x0,x0, 64

	mov x2, 10

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 16
	BL go_n_pixel

	mov x2, 10

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	// Empiezo a Sobre pintar al Mario 

	mov x0, x7 

	mov x2, 12

	mov x3, 2

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	SUB	x0,x0,8

	mov x2, 20

	mov x3, 2

	movz x4, 0xDA, lsl 16	
	movk x4, 0x340F, lsl 00 

	BL horizontal_line
	
	mov x2, 8

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 12
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	SUB	x0,x0, 56

	mov x2, 4

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 6
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 8
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	sub x0, x0, 56

	mov x2, 4

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	// Parte inferior patilla

	MOV x1, 2

	BL go_p_line

	mov x1, 6
	BL go_n_pixel

	mov x2, 4

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	//Bigote 

	MOV x1, 2

	BL go_p_line

	mov x1, 10
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	SUB	x0,x0, 64

	mov x2, 6

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 14
	BL go_n_pixel

	mov x2, 8

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line
 
	SUB	x0,x0, 48

	mov x2, 2

	mov x3, 2

	movz x4, 0xF6, lsl 16	
	movk x4, 0x9534, lsl 00 

	BL horizontal_line

	//Remera 1er parte

	sub x0, x0, 8

	mov x2, 6

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	//Tirante

	MOV x1, 2

	BL go_p_line

	mov x1, 6
	BL go_n_pixel

	mov x2, 4

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 
	
	BL horizontal_line

	//2da parte remera

	MOV x1, 2

	BL go_p_line

	mov x1, 4
	BL go_n_pixel

	mov x2, 6

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	//Remera 1er parte abajo

	sub x0, x0, 48

	mov x2, 8

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	//Tirante

	MOV x1, 2

	BL go_p_line

	mov x1, 8
	BL go_n_pixel

	mov x2, 4

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 
	
	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 4
	BL go_n_pixel

	mov x2, 10

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	//Tirante

	MOV x1, 2

	BL go_p_line

	mov x1, 2
	BL go_n_pixel

	mov x2, 4

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	//3ra Fila remera

	sub x0, x0, 64

	mov x2, 10

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	//Overol

	MOV x1, 2

	BL go_p_line

	mov x1, 10
	BL go_n_pixel

	mov x2, 10

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 10
	BL go_n_pixel

	mov x2, 6

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	
	//4ta Fila remera

	sub x0, x0, 60

	mov x2, 4

	mov x3, 2

	movz x4, 0x8D, lsl 16	
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 4
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 4
	BL go_n_pixel

	mov x2, 4

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 6
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 

	BL horizontal_line

	MOV x1, 2

	BL go_p_line

	mov x1, 2
	BL go_n_pixel

	mov x2, 2

	mov x3, 2

	movz x4, 0x8D, lsl 16
	movk x4, 0x7203, lsl 00 

	BL horizontal_line

	SUB	x0,x0, 56 

	mov x2, 14

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 
	
	BL horizontal_line
	
	SUB	x0,x0,4 

	mov x2, 16

	mov x3, 2

	movz x4, 0xDA, lsl 16
	movk x4, 0x340F, lsl 00 
	
	BL horizontal_line
	
	LDR x30 , [sp] 

	ADD sp, sp, 8 

    ret

.globl make_hongo
make_hongo:

	SUB sp, sp, 8 
	STR x30, [sp] 

    	mov x0, x20
	ADD	x0, x0, 400 //corre el inicio del pixel

	mov x7, x0 // El pixel de inicio del hongo 

	mov x2, 8

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line

    sub x0, x0, 8 

	mov x2, 12

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line

	sub x0, x0, 8 

	mov x2, 16

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line
     
	
	sub x0, x0, 8 

	mov x2, 20

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	sub x0, x0, 8 

	mov x2, 24

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	sub x0, x0, 8 

	mov x2, 28

	mov x3, 4

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	sub x0, x0, 8 

	mov x2, 32

	mov x3, 8

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	add x0, x0, 8 

	mov x2, 28

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 


	add x0, x0, 24

	mov x2, 16

	mov x3, 6

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 
    
	add x0, x0, 8

	mov x2, 12

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 
    

	mov x0,X7  // El pixel de inicio del hongo 
    mov x2, 8

	mov x3, 2

	movz x4,0xfd , lsl 16	//Colores Fondo
	movk x4,0x9a4b , lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 
	//no tocar 
    add x0, x0, 24

	mov x2, 4

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	sub x0, x0, 8

	mov x2, 8

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	mov x2, 10

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 


	add x0, x0, 8

	mov x2, 6

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 


	sub x0, x0, 44

	mov x2, 4

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 


	sub x0, x0, 8

	mov x2, 8

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	mov x2, 8

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	mov x2, 8

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	add x0, x0, 8

	mov x2, 4

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina


	BL horizontal_line 


	mov x1, 6
	BL go_p_line

	mov x1, 16
	BL go_n_pixel

	mov x2, 4

	mov x3, 3

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	mov x1, 2
	BL go_n_pixel

	mov x2, 4

	mov x3, 3

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 
		
    sub x0, x0, 84
	mov x2, 8

	mov x3, 2

	movz x4, 0xfd, lsl 16	//Colores Fondo
	movk x4, 0x9a4b, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 
		
	mov x2, 6

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line 

	mov x1, 2
	BL go_n_pixel

	mov x2, 20

	mov x3, 2

	movz x4, 0xfe, lsl 16	//Colores Fondo
	movk x4, 0xffff, lsl 00 //Colores Fondo Ambos se combina
	BL horizontal_line 
	
	add x0, x0, 8

	mov x2, 16

	mov x3, 4
	

	movz x4, 0xfe, lsl 16	//Colores Fondo
	movk x4, 0xffff, lsl 00 //Colores Fondo Ambos se combina
	BL horizontal_line 

	add x0, x0, 8

	mov x2, 12

	mov x3, 4

	movz x4, 0xfe, lsl 16	//Colores Fondo
	movk x4, 0xffff, lsl 00 //Colores Fondo Ambos se combina
	BL horizontal_line 


	mov x1, 12
	BL go_p_line


	mov x1, 12
	BL go_n_pixel

	mov x2, 6

	mov x3, 2

	movz x4, 0xff, lsl 16	//Colores Fondo
	movk x4, 0x0000, lsl 00 //Colores Fondo Ambos se combina

	BL horizontal_line
 
   	LDR x30 , [sp] 
	ADD	 sp, sp, 8 

    ret 





    
