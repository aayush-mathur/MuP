; Write an ALP that will take display the following “Enter four character word ” and move the cursor to the next line. The user input of a four character string should be taken reversed and displayed.

; For e.g.

; If user enters stop what will be displayed on screen is pots. [Pl note the original string will not be displayed as the user enters it]

; The user should be allowed to enter only 4 characters (no enter allowed)


.model tiny
.486
.data

str1 db 'Enter four character word',0Dh,0AH,'$'

in1 db 5            ;4 characters + enter
in2 db ?           
in3 db 6 dup('$')  ;4 characters + enter + '$'
disnl db 0DH,0AH,'$'

.code
.startup

        lea dx, str1
        mov ah, 09h
        int 21h 

        lea dx, in1
        mov ah, 0ah
        int 21h

        lea dx, disnl
        mov ah, 09h
        int 21h

        lea si, in3
        mov cl, in2 
        lea di, in3
        
x2:     inc di 
        dec cl
        jnz x2

        mov cl, in2

x1:     mov al, [si]
        mov bl, [di]
        mov [si], bl
        mov [di], al
        inc si
        dec di
        sub cl, 2
        cmp cl, 0
        jg x1

        lea dx, in3
        mov ah, 09h
        int 21h


.exit
end

