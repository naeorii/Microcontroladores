
; AssemblerApplication2.asm
;
; Created: 27/03/2025 14:21:13
; Author : aluno
;

.dseg 
var:
x: .byte 2;
.cseg

start:
;configurar portas de entrada e saída
; x = in PORTD    y = out PORT B
; x = x^2 + 2*x
clr r16 ; r16 <- 0
out DDRD, r16 ; PORTD é IN
ldi r16, 0xFF ; r16 <- 255 ou 1111 1111
out DDRB, r16 ; PORTB é out

loop:
in r16, PIND ; ler PORTD (x) e salvar em r16
st var, r16 ; var[0] recebe x
mov r17, r16 ; r17 <- r16 (x)
add r17, r16 ; r17 <- r17 + r16 (2*x)

rjmp loop
