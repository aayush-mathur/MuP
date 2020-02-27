; credits: dator
; Two arrays of unsigned 8 -bit data numbers are stored from location arr1 and arr2. Write a program that will add the contents of arr1 with arr2 and store the addition result including the carry in an unsigned 16-bit array arr3. The count of data in arr1 and arr2  is stored in location cnt1 .

; For e.g if

; data in arr1 is                   45h,       82h,       91h,       73h,       13h

; data in arr2 is                   20h,       7fh,        33h,       8eh,       45h

; Then after the program is run

; arr3 will be         0065h,  0101h,   00c4h,   0101h,   0058h

.model tiny
.data
dat1 db 45h,82h,91h,73h,13h
dat2 db 20h,7fh,33h,8eh,45h
dat3 dw 5 dup(?)
cnt db 5
.code
.startup
	mov cl,[cnt]
	lea si,dat1
	lea di,dat2
	lea bx,dat3
l2:	mov al,[si]
	mov dl,[di]
	add al,dl
	JNC l1
	mov [bx],al
	inc bx
	mov byte ptr [bx],1
	inc bx
	jmp l3
l1:	mov [bx],al
	inc bx
	mov byte ptr [bx],0
	inc bx
l3:	inc si
	inc di
	dec cl
	JNZ l2
.exit
end


	