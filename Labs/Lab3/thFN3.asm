; Write an ALP that will take in a user string of format ‘3 character command dat1 adt2’

; (for e.g. sub 6 5 or add 6 7)

; If the command is anything other than sub then ‘0’ should be displayed on the next line

; If the command is sub and if dat1 is less than dat2 (for e.g. sub 6 7) then ‘0’ should be displayed on the next line else the difference should be displayed (for e.g. sub 6 4 then 2 should be displayed) on the next line. You can assume that the user will enter only small letters for the command.

; The input should be restricted to 7 characters excluding enter (i.e. sub 9 2= 3 characters for command, 1 character for space, 1 character for 1st data, 1 character for space and 1 character for 2nd data)

.model tiny
.486
.data

max db 8
acl db ?
inp1 db 9 dup('?')
disnl db 0AH,0DH,'$'

.code
.startup

    lea dx, max 
    mov ah, 0Ah
    int 21h

    lea dx, disnl 
    mov ah, 09H
    int 21h

    lea si, inp1 
    mov bl, [si]
    cmp bl, 's'
    jne l1
    inc si
    mov bl, [si]
    cmp bl, 'u'
    jne l1
    inc si
    mov bl, [si]
    cmp bl, 'b'
    jne l1

    add si, 2
    mov bl, [si]

    add si, 2
    cmp bl, [si]
    jg l1

    sub [si], bl
    mov cl, 30h
    add [si], cl
    mov dl, [si]
    mov ah, 02H
    int 21h
    jmp l2

    l1: mov dl, '0'
    mov ah, 02H
    int 21h

    l2: .exit
end