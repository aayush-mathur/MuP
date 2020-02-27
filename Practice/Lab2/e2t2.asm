; A n- character string is stored starting from memory location dat1. The string is entirely made-up of
; small alphabets. Write an ALP that will convert every vowel in the string from small to capital letter.
; The value of n is between 10d to 120d and is stored in location cnt1.
; For e.g if the string in dat1 is “microprocessor”
; After the ALP is executed it should become “mIcrOprOcEssOr”

.model	tiny
.486
.data
dat1	db		"microprocessor,programing&interfacing"
cnt1	db		37
vow1	db		"aeiou"
.code
.startup
		lea		si,dat1
		movzx	cx,cnt1
x1:		mov		dl,5
		lea		di,vow1
		lodsb
x2:		scasb
		jz		x3
		dec		dl
		jnz		x2
		jmp		x4
x3:		sub		al,20h
		mov		[si-1],al
x4:		loop	x1		
.exit
end	