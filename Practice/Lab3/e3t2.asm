; A n- character string is stored starting from memory location dat1. The string is entirely made-up of
; small alphabets. Write an ALP that will convert every vowel in the string from small to capital letter.
; The value of n is between 10d to 20d and is stored in location cnt1.
; For e.g if the string in dat1 is “microprocessor”
; After the ALP is executed it should become “mIcrOprOcEssOr”
; The string has to be entered by the user. The updated string has to be displayed on the next line.
.model	tiny
.486
.data
val1	db		21
val2	db		?
dat1	db		23 dup('$')
cnt1	db		?
vow1	db		"aeiou"
dat2	db		0Dh,0Ah,'$'
.code
.startup
		lea		dx,val1
		mov		ah,0ah
		int		21h
		mov		al,val2
		mov		cnt1,al
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
		lea		dx,dat2
		mov		ah,09h
		int		21h
		lea		dx,dat1
		mov		ah,09h
		int		21h
.exit
end	