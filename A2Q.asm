;-------------------------------------------------------------------------------------------------------------------------------------------------------
;Ekamjit Singh Sidhu
;3114221
data	segment							; data segment. Keyword db means define byte. You can also define word (dw)
		iNum	db  225					;Define variable called iNum (this variable is one byte)

message1 db "Enter a string (max 20 char.): " ,13, 10, '$'      

message2 db "The string you entered is: " , 13, 10, '$'

myBStr db 21, 23 dup('$')
										
data	ends
										; stack segment
stack1  segment	stack 		
		db	100 dup(?)      			; This is the stack of 100 bytes
stack1  ends


code    segment
        assume  cs:code, ds:data, ss:stack1

start: 
										;Perform initialization 
		mov ax, data					;Put the starting address of the data segment into the ax register (must do this first)
		mov ds, ax						;Put the starting address of the data segment into the ds register (where it belongs)
		
		mov ax, stack1					;Put the starting address of the stack into the ax register (must do this first)
		mov ss, ax	            		;Put the starting address of the stack segment into the ss register (where it belongs)
        mov sp, 100
;-------------------------------------------------------------------------------------------------------------------------------------------------------		
;****************** Enter Assembly Code Below ******************
    lea dx, message1                     ;load message to dx
    mov ah, 09h                          ;show this message
    int 21h
                        
    lea dx, myBStr    
    mov ah, 0Ah 	                    ;Load address of string
    int 21h

    lea dx, message2                    ;load second message to dx
    mov ah, 09h                         ;show this message
    int 21h
                         
    lea dx, myBStr + 2                   ;Load address of string
    mov ah, 09h                          ;Show entered string
    int 21h
;-------------------------------------------------------------------------------------------------------------------------------------------------------										
		mov ah, 4ch 					;Set up code to specify return to dos
        int 21h							;Interpt number 21 (Return control to dos prompt)

code    ends

end     start
;-------------------------------------------------------------------------------------------------------------------------------------------------------

