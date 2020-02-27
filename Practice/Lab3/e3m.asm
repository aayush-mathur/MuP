.model	tiny
.486
.data
dis3	db	0dh,0ah
loc1	db	"microprocessor8086"
		db	'$'
dis1	db	"Enter the value of m $"
dis2	db	0dh,0ah, "Enter the replacement character $"
cnt1	db	18
off1	db	?
char1	db  ?
.code
.startup
		lea		dx,dis1
		mov		ah,09h
		int		21h
		mov		ah,01h
		int		21h
		and		al,0fh
		mov		off1,al
		lea		dx,dis2
		mov		ah,09h
		int		21h
		mov		ah,01h
		int		21h
		mov		char1,al
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
		lea		dx,dis3
		mov		ah,09h
		int		21h
.exit
end	