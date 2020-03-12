;Write an ALP that will take a single user input of (1-9). Read the character at position user input * 10 from file lab.txt and display the character. The key that the user presses must not be displayed onscreen.

;[The File lab.txt is available for download – you can download this file into your bin folder]

;For e.g. If user enters 8. The program should read the 80th character from file lab.txt and display it.

.model tiny
.486
.data

ip dw ?
fil1 db "lab.txt",0
han1 dw ?
dat1 db 2 dup('$')
num1 db 10

.code
.startup
	
		mov ah, 08h		;read ip
		int 21h
		and al, 0fh
		mov bl, num1
		mul bl
		dec ax
		mov ip, ax
		
		mov ah, 3dh			;open file
		mov al, 02h
		lea dx, fil1
		int 21h
		mov han1, ax
		
		mov ah, 42h		;move file pointer
		mov bx, han1
		mov al, 0
		mov cx, 0
		mov dx, ip
		int 21h
		
		mov ah, 3fh 	;reading from file
		mov bx, han1
		mov cx, 1
		lea dx, dat1
		int 21h
		
		lea dx, dat1	;display output
		mov ah, 09h
		int 21h
		
.exit
end