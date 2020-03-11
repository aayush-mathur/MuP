; Write an ALP that will scan a set of n memory locations (from displacement dat1) that store a set of unsigned bytes. The ALP should count the number of bytes: which when multiplied by the 8-bit data at displacement mulv have only zeroes in the upper byte. This count should be stored in displacement mul1.

;  The value of n will not exceed 9 and is stored in location cnt1.

;  The value to be multiplied with in  mulv  will be between 2 to 9.

; For e.g if

; If data in dat1 is follows

; 88h,12h,2h,15h,56h,24h,0A1h,88h,0F1h

; Value in mulv is 5

; Then after the program is run

; Then count will be 4 (as only 12h,2h,15h,24h when multiplied by 5 will have zeroes in their upper 8-bits)

.model tiny
.486
.data

dat1 db 88h,12h,2h,15h,56h,24h,0A1h,88h,0F1h
mulv db 5
mul1 db 0
cnt1 db 9

.code
.startup

        lea si, dat1
        lea di, mul1
        mov cl, cnt1
        mov bl,5
        mov bh, 0
        

x1:     mov al, [si]
        mul bl
        cmp ah, 0
        jne x2
        add bh,1

x2:     inc si
        dec cl
        jnz x1

        mov [di], bh

.exit
end

; si- 128
; di- 132
