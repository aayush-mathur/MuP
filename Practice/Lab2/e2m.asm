; An n-character string is stored starting from memory location loc1. Write an ALP
; that will replace every mth character of the string with “(double quotes – ASCII
; equivalent for “ is 22H). The value of m can range between 5 to 9 and is stored in
; location off1. The values of n is between 10d to 120d and is stored in location cnt1.
; [The size n need not to be a multiple of m]
; For e.g. if the contents of loc1 is as follows
; loc1:microprocessor
; after the ALP is executed loc1 should be as follows
; loc2:micr”proc”ssor


.model	tiny
.486
.data
loc1	db	"microprocessor,programming&interfacing"
loc2	db	24 dup(?)
cnt1	db	38
off1	db	5
char1	db  22h
.code
.startup
		lea		si,loc1
		movzx	bx,off1
		dec		si
		movzx	ax,cnt1
		div		bl
		cbw
		mov		cx,ax
		mov		al,char1
x1:		mov		[si+bx],al
		add		si,bx
		loop	x1
.exit
end	