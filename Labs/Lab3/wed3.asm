.model tiny
.486
.data

str1 db 0AH, 0DH,"number of values greater than 5 is: ", '$'

.code
.startup

        mov cx, 9
        mov bx, 0

x1:     mov ah, 01h
        int 21h
        
        cmp al, '0'
        je x3
        cmp al, '5'
        jle x2
        add bx, 1

x2:     dec cx
        jnz x1

x3:     lea dx, str1
        mov ah, 09h
        int 21h

        add bx, '0'
        mov dx, bx
        mov ah, 02h
        int 21h

.exit
end

