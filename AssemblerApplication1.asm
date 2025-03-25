; AssemblerApplication1.asm
;
; Created: 25/03/2025 13:53:55
; Author : aluno
;


; Replace with your application code
start:
	ldi r16, 0 ; zera o registrador
	clr r16 ; zera o registrador...usar uma das formas
	
	; DDRB = 0000 0000 -> dizer que PORT B é input
	STS DDRB,r16 ; DDRB <-  00000000
	
	; PORT D é output DDRD = 1111 1111
	SER r16; r16 <- 1111 1111
	STS DDRD, r16

	loop:
	; ler a porta B
	lds r16, PINB ; PINB são os pinos de entrada de PORT B
	ldi r17, 15 ; r17 <- 15
	add r16, r17 ; r16 <- r16 + r17

	STS PORTD, r16 ; PORT D recebe a soma
	rjmp loop ; volta
