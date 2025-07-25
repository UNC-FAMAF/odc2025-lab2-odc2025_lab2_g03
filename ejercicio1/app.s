	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

    #9291ff -- purple


	movz x10, 0x92, lsl 16
	movk x10, 0x91ff, lsl 00

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

    mov x0, x20
	mov x1, 360
	bl go_n_line
    mov x1, 550
    bl go_n_pixel
    bl make_castle

	mov x0, x19         // Restaurar x0 para make_mario
	BL make_mario      // Llamada a la función make_mario

	mov x0 , x7 
 	bl make_hongo 

	mov x1, 200

	BL go_p_line

	BL make_cloud

	mov x1, 150

	BL go_p_line

	mov x1, 150

	BL go_n_pixel

	BL make_cloud

	mov x1, 350

	BL go_p_pixel

	BL make_cloud

	MOV	 x1, 100 

	BL go_p_line

	mov x1, 550

	BL go_n_pixel

	BL make_cloud

	mov x1, 240

	BL go_n_line

	BL make_cloud

	mov x1, 120

	BL go_n_line

	mov x1, 20

	BL	go_n_pixel

	BL	make_arbusto

	mov x1, 5

	BL go_p_line

	mov x1, 605

	BL	go_p_pixel

	BL	make_arbusto

	bl make_mastil

	MOV	 x1, 106

	BL go_n_line 

	BL make_block

    mov x0, x20
    mov x1, 432
    bl go_n_line
    bl make_floor

    mov x0, x20
    mov x1, 304
    bl go_n_line

    mov x1, 128
    bl go_n_pixel
    bl make_block_ramp


	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
