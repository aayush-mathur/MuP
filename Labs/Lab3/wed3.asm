; Write an ALP that will take in user input via the keyboard character by character. The number of characters that should be entered by user is 9.You can assume that the user enters only numbers, your ALP must count the number of numerals entered by the user that has a value greater than 5.The count should be displayed on the next line – the display should be as follows “number of values greater than 5 is:  ” followed by the count. Also any time the user enters ‘0’ then the current count of numbers greater than should be displayed and the program should exit even if 9 characters are not entered. Enter key should not be used to exit the keyboard entry.

; For e.g.

; If user enters the following characters

; 124566178

; The display on the next line should be “number of values greater than 5 is: 4”

; Alternatively, if the user enters

; 370

; The program should display on the next line should be “number of values greater than 5 is: 1” – this display should be done, and program should exit even though all nine characters are not entered.

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

