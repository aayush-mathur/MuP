; Write an ALP that will take in user input via the keyboard, character by character if the character entered is in CAPS it should be converted to small alphabets and displayed, else displayed as it is. This program should run until the user presses 'enter'. Enter should not be displayed.

; For e.g.

; If user enters miCROprocessor and INTERFAcing (followed by enter) what will be displayed on screen is microprocessor and interfacing. [Pl note the original string will not be displayed as the user enters it]

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
