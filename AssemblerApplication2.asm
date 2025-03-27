;
; AssemblerApplication2.asm
;
; Created: 27/03/2025 14:21:13
; Author : aluno
;

;
; AssemblerApplication2.asm
;
; Created: 27/03/2025 13:59:14
; Author : aluno
;

.dseg
var:
	A:	.byte 1;
	B:  .byte 1;
	.cseg

start:
    ;Configurar portas e entrada
	   ; =in PORTD y=out PORTB
   	;y=x^2 + 2*x

	 clr r16			; r16 <- 0
	 out DDRD, r16   ;PORTD é IN
	 LDI r16, 0xFF	;r16 <- 255 ou 1111 1111
	 out DDRB, r16	; PORTB é out

	loop:
		IN r16, PIND  ; ler portD (x) e salvar em r16
		STS A, r16  ; var[0] recebe X
		MOV r17, r16  ; r17 <- r16(A)
		ADD r17, r16  ; r17 <- r17 + r16 (2*A)

		MUL r16, r16  ;r1:r0 <- r16*r16
		ADD r17, r0   ; r17 <- r17 + r0
		sts b, r17

		out PORTB, r17   ;saída <-r17


		rjmp loop
