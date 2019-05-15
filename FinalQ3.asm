INCLUDE Irvine32.inc
INCLUDE macros.inc

BUFFER_SIZE = 60

.data
msg1 byte "Firstname Lastname: ", 0
result byte 80 DUP (?)
space byte " ", 0
token byte ?
entry byte BUFFER_SIZE DUP(?)
bufLength dword 0
counter dword 0

.code
main PROC
;--------------------------------------------
;taking the input----------------------------
mov edx, offset msg1
call writeString

mov edx, offset entry
mov ecx, sizeof entry
call readString

call StrLength
mov bufLength, eax

;--------------------------------------------
;looking at the input as an array------------
mov esi, offset entry
L1:
mov al, [esi]
mov token, al
mov al, token
;call writechar

cmp token, ' ' ;stopping once the ascii is equal to space
je L3
add esi, 1
inc counter
jmp L1


;------------------------------------------
;events that take place after the space----
L3:
add esi, 1
mov al, [esi]
mov token, al
mov al, token
call writechar

inc counter
mov ebx, counter
cmp ebx, bufLength
je DNL
jmp L3

DNL:
invoke ExitProcess, 0
main endp
end main