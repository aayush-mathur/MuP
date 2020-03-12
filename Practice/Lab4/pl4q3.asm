; Write an ALP to search for number of occurrences of a character from in the file abc.txt. The character
; has to be entered by the user and the number of occurrences of the character can vary from 0 to 9.
; The ALP should display “Enter the character to search” The user then enters the caharcter. The
; program has to count the number of times the character occurs in the file and display it on the next
; line. The file abc.txt is uploaded along with the question. The number of characters in the file is fixed
; at 50.
; If abc.txt has the following data
; Never say "oops!!!" always say "ah, interesting!!"
; The ALP should display
; “Enter the character to search ”
; If the user enters the value ! - then the ALP should display the following on the next line
; 5
.model tiny
.486
.data

fil1 db "abc.txt",0
dis1 db "Enter the character to search: $"
char1 db ?
dis2 db 0AH, 0DH
dis3 db 30h, '$'            ;30h is ascii for 0
cnt1 db 50
dat1 db 50 dup(?)
han1 dw ?

.code
.startup

        lea dx, dis1        ;display message
        mov ah, 09h
        int 21h

        mov ah, 01h         ;input char1
        int 21h
        mov char1, al
    
        mov ah, 3dh         ;open the file
        lea dx, fil1
        mov al, 02h
        int 21h
        mov han1, ax

        mov ah, 3fh         ;read the file
        mov bx, han1
        movzx cx, cnt1      ;50 bytes to read
        lea dx, dat1        ;file's data inside dat1
        int 21h

        mov ah, 3eh         ;close the file
        int 21h

        movzx cx, cnt1      ;counting the no. of occurrences of char1 in dat1
        lea di, dat1
        mov al, char1

x1:     scasb
        jnz x2
        inc dis3

x2:     loop x1

        lea dx, dis2
        mov ah, 09h
        int 21h     

.exit
end