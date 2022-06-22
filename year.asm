
section .text

	global _start
_start:
														
								;Where the code start from

		mov 	eax,4
		mov 	ebx,1
		mov 	ecx,ques1
		mov 	edx,len1
		int 	80h	

		mov 	eax,3			;system call number read
		mov 	ebx,2			;file descriptor stdin	
		mov 	ecx,age			;Tranfer user age into ecx register
		mov 	edx,4 			;length of user age at least 2
		int 	0x80			;call kernel

		mov 	eax,4
		mov 	ebx,1
		mov 	ecx,ques
		mov 	edx,len
		int 	80h		

		mov 	edx,5
		mov 	ecx,year
		mov 	ebx,2
		mov 	eax,3
		int 	80h

		mov 	eax,[age]
		sub 	eax, "0"
		mov 	ebx,[year]
		sub 	ebx, "0"

		add 	eax, ebx

		mov 	[res],eax

		mov 	eax, 4
		mov 	ebx,1
		mov 	ecx,res
		mov 	edx,4
		int 	80h


		mov 	ebx,0
		mov 	eax,1
		int 	0x80




section .bss
age 	resb 4					;age of the user
res 	resw 4		
year 	resw 5


section .data
ques 	db "Enter the current year:", 0ax
len equ $ - ques
ques1 	db "Enter your age:", 0ax
len1 equ $ - ques1