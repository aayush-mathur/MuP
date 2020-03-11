; Two n character strings are stored in locations dat1 and  dat2. Write an ALP that will exchange the alternate characters of the two strings. (0th, 2nd, 4th , 6th , 8th , 10th,12th,14th ). The value of n is stored in location cnt1. [You can assume that both strings will be of same size]

; For e.g.

; If dat1 has : abcdefghijklmno

; And dat2 has: ABCDEFGHIJKLMNO

; Then after the program is run

; dat1: AbCdEfGhIjKlMnO

; dat2: aBcDeFgHiJkLmNo

.model tiny
.486
.data

dat1 db "abcdefghijklmno"
dat2 db "ABCDEFGHIJKLMNO"
cnt1 dw 15

.code
.startup

        mov cx, cnt1
        lea si, dat1
        lea di, dat2


x1:     mov al, [si]
        mov bl, [di]
        mov [si], bl
        mov [di], al
        add si, 2
        add di, 2
        sub cx, 2
        cmp cx, 0
        jg x1

.exit
end
