; Write an ALP that will examine a string of 20 characters. The string is stored from location str1. The ALP should look for a space character in the string, and then replace all characters that follow the space with ‘&’ character.

; str1 has the following data

; microprocessor 80286

; Then after the program is run

; str1 should have the following data

; microprocessor &&&&&

; Note: You can assume that space will not be the first or the last character. There will always be atleast one character before and after space


.model tiny
.486
.data
str1 db "microprocessor 80286"

.code
.startup

mov cl, 20
lea si, str1
mov bl, ' '
mov bh, '&'

x1: mov al, [si]
inc si
dec cl
cmp al,bl
jnz x1

x3: mov [si], bh
inc si
dec cl
jnz x3

.exit
end
