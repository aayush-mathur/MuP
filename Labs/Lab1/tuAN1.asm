; A 10-character string of small alphabets is stored in memory location with label ‘loc1’. Write an ALP that will insert spaces between the characters and convert the small alphabets to caps and store the modified string in memory location with label ‘loc2’.

; For e.g. if the contents of loc1 is as follows

; loc1: hellomicro

; after the ALP is executed loc2 should be as follows

; loc2:H E L L O M I C R O

.model tiny
.486
.data

loc1 db "hellomicro"
loc2 db 19 dup(" ")

.code
.startup

        mov cx, 10
        lea si, loc1
        lea di, loc2

x1:     lodsb
        stosb
        inc di
        dec cx
        jnz x1

.exit
end

loc1- 0116
loc2- 0120
