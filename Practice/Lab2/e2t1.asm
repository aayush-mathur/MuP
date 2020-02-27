; A n 32-bit data is stored starting from memory location dat1. Write an ALP that will convert every mth
; double word from little endian to big endian format (only the mth double word should be converted).
; The value of m can range between 2 to 4 and is stored in location off1. The value of n is between 10d
; to 120d and is stored in location cnt1. [The size n need not be a multiple of m]

.model	tiny
.486
.data
dat1	dd	12345678h,22334455h,0aabbccddh,0ffeeddcch,90807060h,10203040h,50607080h,90a0b0c0h,11223344h,33445566h
cnt1	db	10
off1	db	3
.code
.startup
		lea		si,dat1
		sub		si,4
		mov		bl,off1
		movzx	ax,cnt1
		div		bl
		cbw
		mov		cx,ax
		mov		al,4
		mul		bl
		mov		bx,ax
x1:		mov		eax,[si+bx]
		bswap	eax
		mov		[si+bx],eax
		add		si,bx
		loop	x1
.exit
end	