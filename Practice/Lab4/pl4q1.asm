; Write an ALP to read a set of n characters from the starting location of file abc.txt. The value of n has
; to be entered by the user and can vary from 1 to 9. The ALP should display “Enter number of characters
; to read ” The user then enters the value. The program has to then read the n characters and display it
; on the next line. The file abc.txt is uploaded along with the question.
; If abc.txt has the following data
; abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRST.
; The ALP should display
; “Enter number of characters to be read ”
; If the user enters the value 3- then the ALP should display the following on the next line
; ab

.model tiny
.486
.data

fil1 db "abc.txt",0
dis1 db "Enter number of characters to read: $"
dis2 db 0DH, 0AH,'$'
dis3 db 10 dup('$')
cnt1 db ?
han1 dw ?

.code
.startup

        lea dx, dis1
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h
        and al, 0fh         ;the input taken is in ascii, mask the upper nibble and you get the decimal val(0-9)
        mov cnt1, al 

        mov ah, 3dh         ;to open file
        lea dx, fil1
        mov al, 02h
        int 21h
        mov han1, ax

        mov ah, 3fh         ;reading a file
        mov bx, han1       
        movzx cx, cnt1 
        lea dx, dis3
        int 21h

        mov ah, 3eh         ;closing file
        int 21h

        lea dx, dis2        ;display the characters read
        mov ah, 09h
        int 21h

.exit
end

