INCLUDE Irvine32.inc
INCLUDE macros.inc

.data

msg byte "enter a number: " , 0

.code
main PROC

mov edx, offset msg
call writeString

call readDec  

call increment


invoke ExitProcess, 0
main endp

increment PROC
add eax, 5
mWrite "The updated value is: "
call writeDec
ret 
increment ENDP

end main
