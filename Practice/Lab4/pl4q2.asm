; Write an ALP to read the n
; th character from the starting location of file abc.txt. The value of n has to
; be entered by the user and can vary from 1 to 9. The ALP should display “Enter the offset from which
; to read ” The user then enters the value. The program has to then read the n
; th character and display
; it on the next line. The file abc.txt is uploaded along with the question.
; If abc.txt has the following data
; abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRST.
; The ALP should display
; “Enter number the offset from which to read ”
; If the user enters the value 3- then the ALP should display the following on the next line
; c
.model tiny
.486
.data

fil1 db "abc.txt",0
dis1 db "Enter the offset from which to read: $"
dis2 db 0Ah, 0Dh            ;theres a reason why no '$' in this(explained at the end)
dis3 db 2 dup('$')
cnt1 db ?
han1 dw ?

.code
.startup

        lea dx, dis1        ;display dis1
        mov ah, 09h
        int 21h
         
        mov ah, 01h         ;reading cnt1
        int 21h
        and al, 0fh         ;masking upper nibble to get decimal val(0-9)
        dec al
        mov cnt1, al

        mov ah, 3dh         ;opening fil1
        lea dx, fil1
        mov al, 02h         ;read/write both
        int 21h
        mov han1, ax

        mov bx, ax          ;moving the file pointer
        mov ah, 42h
        mov al, 0h          ;relative to the beginning
        mov cx, 0h      
        movzx dx, cnt1      
        int 21h

        mov ah, 3fh         ;reading byte at location cnt1
        mov bx, han1
        mov cx,1            ;number of bytes to read
        lea dx, dis3
        int 21h

        mov ah, 3eh         ;closing file
        int 21h
        
        lea dx, dis2        ;displaying the char
        mov ah, 09h
        int 21h

        ;since dis2 doesn't have the '$' what it does is it displays
        ;dis2 ans then goes on to display dis3 as well and then stops
    
.exit
end
