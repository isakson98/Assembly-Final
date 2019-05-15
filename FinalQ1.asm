INCLUDE Irvine32.inc
INCLUDE macros.inc

.data

msg1 byte "Not divisible by 11", 0
msg2 byte "Divisible by 11", 0
divisor byte 11
dividend byte 110

.code
main PROC

mov eax, 0
mov ebx, 0
mov edx, 0


mov al, dividend
mov bl, divisor

L1:	
	sub al, divisor
	
	cmp al, 0
	jg L1
	je L2
	jl L3
L2:
	mov edx, offset msg2
	call WriteString
	jmp DNL

L3:
	mov edx, offset msg1
	call WriteString

DNL:

invoke ExitProcess, 0
main ENDP
END main