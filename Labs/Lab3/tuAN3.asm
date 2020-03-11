.model tiny
.486
.code
.startup

x1:     mov ah, 08h
        int 21h
        
        cmp al, 0Dh
        je x2

        cmp al, "a"
        jnl x3
        add al, 32
        
x3:     mov dl, al
        mov ah, 02h
        int 21h
        jmp x1

x2:     
.exit
end
