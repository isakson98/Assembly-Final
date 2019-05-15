INCLUDE Irvine32.inc
INCLUDE macros.inc ;message directly on terminal

BUFFER_SIZE = 20

.data
buffer1 byte BUFFER_SIZE+1 DUP (?)
buffer2 byte BUFFER_SIZE+1 DUP (?)
token byte ?
msg1 byte "enter filename: ", 0
filename byte 80 DUP (?) ;because its an arrray 
filehandle handle ?		 ;handle is datatype
bufLength dword 0

.code
main PROC

;read input from user
mWrite "Enter first name: "
mov edx, offset buffer1
mov ecx, BUFFER_SIZE
call ReadString

call StrLength
mov bufLength, eax

;read input from user
mWrite "Enter age: "
mov edx, offset buffer2
mov ecx, BUFFER_SIZE
call ReadString

;write output to a file

;------------------------------------------
;--------------------------------------------
;looking at the input as an array------------
mov esi, offset buffer1
L1:
mov al, [esi]
mov token, al
mov al, token

cmp token, ' ' ;stopping once the ascii is equal to space
je L3
add esi, 1
jmp L1
;------------------------------------------
L3:
mov ebx, buflength
mov [buffer1 + ebx], '.'
mov [buffer1 + ebx +1], 't'
mov [buffer1 + ebx + 2], 'x'
mov [buffer1 + ebx + 3], 't'
;------------------------------------------
;------------------------------------------


;; take output filenmae from user

mov edx, offset buffer1
mov ecx, SIZEOF buffer1

; open the file for input
call CreateOutputFile  ;filehandle points to the file
mov filehandle, eax

;write to the output file
mov edx, offset buffer2 ;buffer has the file
mov ecx, BUFFER_SIZE
call WriteToFile

;close file
call CloseFile

invoke ExitProcess, 0
main endp
end main

