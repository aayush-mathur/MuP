; Write an ALP that will examine a set of 10 signed 8-bit nos. The numbers are stored from location num1. All the positive numbers must be copied to location starting from pos1 and all negative numbers must be copied to location starting from neg1.

; For e.g.

; num1 has the following data

; -67,45,78,67,90,100,23,-90,-87,-86

; Then after the program is run

; pos1 should have the following data

; 45,78,67,90,100,23

; neg1 should have the following data

; -67, -90,-87,-86

.model tiny
.486
.data

num1 db -67,45,78,67,90,100,23,-90,-87,-86
pos1 db 10 dup(?)
neg1 db 10 dup(?)

.code
.startup

        mov cx, 10
        lea si, num1
        lea di, neg1

x1:     mov al, [si]
        cmp al, 0
        jge x2
        mov [di], al
        inc di
        
x2:     inc si
        dec cx
        jnz x1

        mov cx, 10
        lea si, num1
        lea di, pos1   

x3:     mov al, [si]
        cmp al, 0
        jle x4
        mov [di], al
        inc di

x4:     inc si
        dec cx
        jnz x3

.exit
end
