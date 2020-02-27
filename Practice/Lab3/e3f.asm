; n 16-bit data are stored starting from memory location loc1. Write an ALP that will copy selected data
; in certain positions into memory location loc2. The number of data to be copied is stored in offc. offc
; can be any value from 2 to n. The value of n is between 1d to 9d and is stored in location cnt1. The
; positions of the data that have to be copied are stored from off1 onwards.
; The ALP has to take the offset values from user. If offc is 5 then the following process must be done 5
; times.”
; “Enter offset to be copied “. User will enter a single digit as offset. This will be repeated offc times.
; Each time “Enter the offset to be copied “. Must be displayed on the new line.
; For eg.
; cnt1: 7
; offc: 4
; loc1: 1234h,4567h,1233h,1457h,1abch,6780h,2314h
; off1: 1,2,5,1 (given by user)
; after the ALP is executed loc2 should be as follows
; loc2:1234h,4567h,1abch,1234h
.model	tiny
.486
.data
loc1	dw	1234h,1235h,3456h,1acdh,5600h,1a20h,20c0h,8097h,2131h,1bbch
loc2	dw	10 dup(?)
cnt1	db	10
off1	db	2,3,6,7,10
offc	db	5
dis1	db	"Enter Offset to be copied $"
spc1	db	0dh,0ah,'$'
.code
.startup
		movzx	cx,offc
		lea		di,off1
xa:		lea		dx,dis1
		mov		ah,09h
		int		21h
		mov		ah,01h
		int		21h
		and		al,0fh
		stosb
		lea		dx,spc1
		mov		ah,09h
		int		21h
		loop	xa
		lea		si,loc1
		lea		di,loc2
		lea		bx,off1
		sub		si,2
		mov		bp,si
		movzx	cx,offc
x1:		mov		si,bp
		mov		al,2
		mul		byte ptr[bx]
		add		si,ax
		movsw
		inc		bx
		loop	x1
.exit
end