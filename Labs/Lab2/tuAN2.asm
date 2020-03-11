; n 16-bit data are stored starting from memory location loc1. Write an ALP that will copy selected data in certain positions into memory location loc2. The number of data to be copied is stored in offc. offc can be any value from 2 to n. The value of n is between 10d to 120d and is stored in location cnt1. The positions of the data that have to be copied are stored from off1 onwards.

; For e.g.

; cnt1: 7

; offc: 4

; loc1: 1234h,4567h,1233h,1457h,1abch,6780h,2314h

; off1:1,2,5,7

; after the ALP is executed loc2 should be as follows

; loc2: 1234h,4567h,1abch,2314h

.model tiny
.486
.data

loc1 dw 1234h,4567h,1233h,1457h,1abch,6780h,2314h
loc2 dw 4 dup(?)
offc db 4
cnt1 db 7
offc1 db 1,2,5,7

.code
.startup

        mov cl, offc
        lea bx, offc1
        lea di, loc2

x1:     lea si, loc1
        mov bp, [bx]
        and bp, 0fh
        inc bx
        sub si, 2
        and ax, 0
        mov al, 2
        mov dx, bp
        mul dl
        mov bp, ax
        mov ax, [si+bp]
        mov [di], ax   
        add di, 2
        dec cl
        jnz x1

.exit
end


