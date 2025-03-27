;
; AssemblerApplication3.asm
;
; Created: 27/03/2025 14:56:01
; Author : aluno
;


.dseg
var:
	A:	.byte 1;
	B:  .byte 1;
	.cseg

start:
    ;Faça B = A-100. A está em port D e B na port B.

		clr r16			; r16 <- 0
		out DDRD, r16   ;PORTD é IN
		LDI r16, 0xFF	;r16 <- 255 ou 1111 1111
		out DDRB, r16	; PORTB é out

	loop:
		IN r16, PIND  ; ler portD (x) e salvar em r16
		STS A, r16  ; var[0] recebe X
		SUBI r16, 100  ; r16 <- r16 - 100

		STS B, r16    ; B<-r16
		out PORTB, r16   ;saída <-r17
		JMP loop
