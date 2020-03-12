; Write an ALP to replace then
; thcharacter from the starting location of file abc.txt with character
; entered by the user. The value of n has to be entered by the user and can vary from 1 to 9. The ALP
; should display “Enter the offset in which to write ” The user then enters the offset value. The
; program then displays “Enter the value to write:” on the next line. The user then enters the
; replacement character. The program then has to replace the n
; th characterin the file. The file abc.txt
; is uploaded along with the question.
; If abc.txt has the following data
; Never say "oops!!!" always say "ah, interesting!!"
; The ALP should display
; Enter number the offset in which to write
; If the user enters the value 3- then the ALP should display the following on the next line
; Enter the value to write:
; If the user enters ?. The n the file abc.txt is updated to
; Ne?er say "oops!!!" always say "ah, interesting!!"

.model tiny
.486
.data

fil1 db "abc.txt",0
dis1 db "Enter the offset in which to write: $"
dis2 db 0AH, 0Dh, "Enter the value to write: $"
cnt1 db ?
val1 db ?
han1 dw ?

.code
.startup

        lea dx, dis1
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h
        and al, 0fh
        dec al
        mov cnt1, al

        lea dx, dis2
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h
        mov val1, al

        mov ah, 3dh
        lea dx, fil1
        mov al, 02h
        int 21h
        mov han1, ax

        mov bx, ax
        mov ah, 42h
        mov al, 0
        mov cx, 0h 
        movzx dx, cnt1
        int 21h

        mov ah, 40h
        mov bx, han1
        mov cx, 1
        lea dx, val1
        int 21h

        mov ah, 3eh
        int 21h        

.exit
end