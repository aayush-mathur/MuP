; Write an ALP that will examine a set of 10 signed 16-bit nos. The numbers are stored from location dat1. All the positive numbers must be converted to negative and all negative numbers to positive, then sign extended to a 32-bit number and stored from location datn  onwards.

; For e.g if

; dat1 has the following data(stored as 16-bits)

; -456,-567,890,236,309,-907,-1004,1230,2378,-1456

; Then after the program is run

; datn should have the following data sign extended to 32-bit data

; 456, 567, -890, -236, -309, 907,1004, -1230, -2378, 1456

; Pl Note: This is the decimal equivalent - what you will see in memory is the hex equivalent

.model tiny
.486
.data

dat1 dw -456,-567,890,236,309,-907,-1004,1230,2378,-1456
datn dd 10 dup(?)

.code
.startup

        mov cx, 10
        lea si, dat1
        lea di, datn
        mov bx, -1

x1:     lodsw
        mul bx
        movsx eax, ax
        mov [di], eax
        add di, 4
        dec cx
        jnz x1
    
.exit
end

