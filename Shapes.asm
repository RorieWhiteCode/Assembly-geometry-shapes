.model small
.stack 100h
.data
;variablename type value or default initialization
sentence  db "Please Select a choice:$"
sentence2 db "A-BASIC SHAPES B-COMBINATION OF SHAPES C-MULTIPLE COLORS D-ROTATION E-SHIFTING F-CHANGING COLOURS ESC-EXIT$"
sentence1 db "SELECT A-SQUARE B-TRIANGLE$"
pressanykey1 db "Press any key to continue...$"
COUNTERforever DB 1
triangleloop1 db 1
INITTOPBOTLEFTCX DW 170
INITTOPLEFTRIGHTDX DW 120
INITCMPTOPBOT DW 470
INITBOTDX DW 360
INITCMPLEFTRIGHT DW 360
INITRIGHTCX DW 470
SHIFTCOUNTER1 DW 1
SHIFTCOUNTER2 DW 1
trianglecolor db 0fh
squarecolor db 01h
doorcolor db 05H
changecolorcount1 dw 1
.code
start:
	MOV AX,@DATA	; get the address of the data segment 
	MOV DS, AX		; and store it in DS register 
	MOV AH, 0Fh		; get current video mode  
	INT 10h 
	PUSH AX			; save current video mode 
LOOPforever:
	CALL CLEARSCREEN
	CALL TEST1
	CMP COUNTERforever, 2
	JB LOOPforever
	MOV AH, 07h 	; wait for key press to exit program
	INT 21h 
	POP AX 			; retrieve original video mode  
	MOV AH, 00h 
	INT 10h 		; restore original video mode 
	MOV AX, 4C00H 	; Exit to DOS function 
	INT 21H	
CLEARSCREEN PROC
	MOV AH, 00h 	; set video mode  
	MOV AL, 12h 	; graphics 640x480 
	INT 10h
	RET
CLEARSCREEN ENDP
PRESSANYKEY PROC
	MOV AH, 08h
	INT 21h
	mov ah,02h
	mov dh,10h
	int 10h
	mov ah, 09h
	mov dx, offset pressanykey1
	int 21h
	mov ah, 08h
	int 21h
PRESSANYKEY ENDP
DELAY PROC
	mov bp, 10
	mov si, 10
	delay2:
	dec bp
	nop
	jnz delay2
	dec si
	cmp si,0    
	jnz delay2
	RET
DELAY ENDP
BSQUARE PROC 
	MOV CX, 170 	 
	MOV DX, 120 	 
	MOV AX, 0C02h 	 

	TOPSQ: INT 10h 	 
	INC CX 			
	CMP CX, 470  	  
	JB TOPSQ 		
	
	MOV CX, 170
	MOV DX, 360
	MOV AX, 0C02H
	
	BOTSQ: INT 10H
	INC CX
	CMP CX, 470
	JB BOTSQ
	
	MOV CX, 170
	MOV DX, 120
	MOV AX, 0C02H
	
	LEFTSQ:INT 10H
	INC DX
	CMP DX, 360
	JB LEFTSQ
	
	MOV CX, 470
	MOV DX, 120
	MOV AX, 0C02H
	
	RIGHTSQ:INT 10H
	INC DX
	CMP DX, 360
	JB RIGHTSQ
	RET
BSQUARE ENDP
BTRIANGLE PROC
	MOV CX, 320 	 
	MOV DX, 120 	 
	MOV AX, 0C02h 	
	RIGHTTR: INT 10h 	 
	INC CX 			
	INC DX
	CMP DX, 360  	  
	JB RIGHTTR
	
	MOV CX, 320 	
	MOV DX, 120 	
	MOV AX, 0C02h 	 
	LEFTTR: INT 10h 	 
	DEC CX 			
	INC DX
	CMP DX, 360  	  
	JB LEFTTR 		
 
	MOV CX, 80	 	 
	MOV DX, 360 	
	MOV AX, 0C02h 	
	BOTTR: INT 10h 
	INC CX
	CMP CX, 560  	  
	JB BOTTR 		
	RET
BTRIANGLE ENDP
COMBISHAPES PROC
	; SQUARE 
	MOV CX, 220 	
	MOV DX, 240 	
	MOV AX, 0C02h 	 
	TOPSQCOMBI: INT 10h 	 
	INC CX 			
	CMP CX, 420  	  
	JB TOPSQCOMBI 	 
	
	MOV CX, 220
	MOV DX, 440
	MOV AX, 0C02H
	BOTSQCOMBI: INT 10H
	INC CX
	CMP CX, 420
	JB BOTSQCOMBI
	
	MOV CX, 220
	MOV DX, 240
	MOV AX, 0C02H
	LEFTSQCOMBI:INT 10H
	INC DX
	CMP DX, 440
	JB LEFTSQCOMBI
	
	MOV CX, 420
	MOV DX, 240
	MOV AX, 0C02H
	RIGHTSQCOMBI:INT 10H
	INC DX
	CMP DX, 440
	JB RIGHTSQCOMBI
	
	;TRIANGLE
	MOV CX, 320  
	MOV DX, 70 	 
	MOV AX, 0C02h 	 
	RIGHTTRCOMBI: INT 10h 	
	INC CX 			
	INC DX
	CMP DX, 240  	
	JB RIGHTTRCOMBI 		

	MOV CX, 320 	
	MOV DX, 70 	
	MOV AX, 0C02h 	 
	LEFTTRCOMBI: INT 10h 	
	DEC CX 			
	INC DX
	CMP DX, 240  	  
	JB LEFTTRCOMBI 		

	MOV CX, 150	 	 
	MOV DX, 240 	
	MOV AX, 0C02h 	 
	BOTTRCOMBI: INT 10h 	
	INC CX
	CMP CX, 490  	 
	JB BOTTRCOMBI 		
	;DOOR
	MOV CX, 280 	
	MOV DX, 360 	
	MOV AX, 0C02h 	
	DOORTPCOMBI: INT 10h 	
	INC CX 			
	CMP CX, 360  	  
	JB DOORTPCOMBI 		
	
	MOV CX, 280
	MOV DX, 360
	MOV AX, 0C02H
	DOORLEFTCOMBI:INT 10H
	INC DX
	CMP DX, 440
	JB DOORLEFTCOMBI
	
	MOV CX, 360
	MOV DX, 360
	MOV AX, 0C02H
	DOORRIGHTCOMBI:INT 10H
	INC DX
	CMP DX, 440
	JB DOORRIGHTCOMBI
	RET
COMBISHAPES ENDP
COMBICOLORS PROC
	MOV CX, 220 	
	MOV DX, 240 	
	MOV AX, 0C02h 	 
	TOPSQCOLORS: INT 10h 	
	INC CX
	CMP CX, 420  
	JB TOPSQCOLORS
	
	MOV CX, 220
	MOV DX, 440
	MOV AX, 0C01H
	BOTSQCOLORS: INT 10H
	INC CX
	CMP CX, 420
	JB BOTSQCOLORS
	
	MOV CX, 220
	MOV DX, 240
	MOV AX, 0C01H
	LEFTSQCOLORS:INT 10H
	INC DX
	CMP DX, 440
	JB LEFTSQCOLORS
	
	MOV CX, 420
	MOV DX, 240
	MOV AX, 0C01H
	RIGHTSQCOLORS:INT 10H
	INC DX
	CMP DX, 440
	JB RIGHTSQCOLORS
	
	;TRIANGLE
	MOV CX, 320 	
	MOV DX, 70 	
	MOV AX, 0C0Fh 	
	RIGHTTRCOLORS: INT 10h 	
	INC CX 			
	INC DX
	CMP DX, 240  	
	JB RIGHTTRCOLORS 		

	MOV CX, 320 	 
	MOV DX, 70 	
	MOV AX, 0C0Fh 	
	LEFTTRCOLORS: INT 10h 	 
	DEC CX 			
	INC DX
	CMP DX, 240  	
	JB LEFTTRCOLORS 		

	MOV CX, 150	 	 
	MOV DX, 240 	
	MOV AX, 0C0Fh 	 
	BOTTRCOLORS: INT 10h 	
	INC CX
	CMP CX, 490  	
	JB BOTTRCOLORS 		
	
	;DOOR
	MOV CX, 280 	
	MOV DX, 360 	
	MOV AX, 0C05h 

	DOORTPCOLORS: INT 10h 	 
	INC CX 			
	CMP CX, 360  	 
	JB DOORTPCOLORS 		 
	
	MOV CX, 280
	MOV DX, 360
	MOV AX, 0C05H
	DOORLEFTCOLORS:INT 10H
	INC DX
	CMP DX, 440
	JB DOORLEFTCOLORS
	
	MOV CX, 360
	MOV DX, 360
	MOV AX, 0C05H
	DOORRIGHTCOLORS:INT 10H
	INC DX
	CMP DX, 440
	JB DOORRIGHTCOLORS
	RET
COMBICOLORS ENDP
TRIANGLEROTATE PROC
TRIANGLELOOP:	CALL TRIANG1
	CALL DELAY
	CALL CLEARSCREEN
	CALL TRIANG2
	CALL DELAY
	CALL CLEARSCREEN
	CALL TRIANG3
	CALL DELAY
	CALL CLEARSCREEN
	INC triangleloop1
	CMP triangleloop1, 5
	JB TRIANGLELOOP
	
TRIANG1 PROC
		
	MOV CX, 320 	
	MOV DX, 120 	
	MOV AX, 0C02h 	 
	RIGHTTRLOOP: INT 10h 	
	INC CX 			
	INC DX
	CMP DX, 360  	
	JB RIGHTTRLOOP 		

	MOV CX, 320 	
	MOV DX, 120 	
	MOV AX, 0C02h 	
	LEFTTRLOOP: INT 10h 
	DEC CX 			
	INC DX
	CMP DX, 360  	
	JB LEFTTRLOOP 		

	MOV CX, 80	 	
	MOV DX, 360 	
	MOV AX, 0C02h 	

	FLATTR: INT 10h 	
	INC CX
	CMP CX, 560  	
	JB FLATTR 		
	RET
TRIANG1 ENDP
TRIANG2 PROC
	
	MOV CX, 160 	; start from column 170 
	MOV DX, 240 	; and row 120 
	MOV AX, 0C02h 	; AH=0Ch and AL = pixel color (green) 
	
	RIGHTTR2: INT 10h 	; draw pixel 
	INC CX 			; go to next column
	DEC DX
	CMP CX, 320  	; check if column=470  
	JB RIGHTTR2 		; if not reached column=470, then continue

	; draw a green color line from(170, 240) to (470, 240) 
	MOV CX, 160 	; start from column 170 
	MOV DX, 240 	; and row 120 
	MOV AX, 0C02h 	; AH=0Ch and AL = pixel color (green) 

	LEFTTR2: INT 10h 	; draw pixel 
	INC CX 			; go to next column
	INC DX
	CMP CX, 320  	; check if column=470  
	JB LEFTTR2 		; if not reached column=470, then continue

	; draw a green color line from(170, 240) to (470, 240) 
	MOV CX, 320	 	; start from column 170 
	MOV DX, 80 	; and row 120 
	MOV AX, 0C02h 	; AH=0Ch and AL = pixel color (green) 

	FLATTR2: INT 10h 	; draw pixel  			; go to next column
	INC DX
	CMP DX, 400  	; check if column=470  
	JB FLATTR2 		; if not reached column=470, then continue
	
	RET
TRIANG2 ENDP
TRIANG3 PROC
	MOV CX, 320 	
	MOV DX, 400 	
	MOV AX, 0C02h 	
	RIGHTTR3: INT 10h 	
	INC CX 			
	DEC DX
	CMP CX, 480  	
	JB RIGHTTR3 		

	MOV CX, 320 	
	MOV DX, 80 
	MOV AX, 0C02h 	
	LEFTTR3: INT 10h 	
	INC CX 			
	INC DX
	CMP CX, 480  	
	JB LEFTTR3 		

	MOV CX, 320	 	
	MOV DX, 80 	 
	MOV AX, 0C02h 	
	FLATTR3: INT 10h 	
	INC DX
	CMP DX, 400  	
	JB FLATTR3 		
	RET
TRIANG3 ENDP
RET
TRIANGLEROTATE ENDP
SQUARESHIFT PROC
SHIFTLOOP2:
	CALL SHIFTLOOP1
	CALL DELAY
	CALL CLEARSCREEN
	ADD INITTOPBOTLEFTCX ,10
	ADD INITCMPTOPBOT ,10
	ADD INITRIGHTCX ,10
	INC SHIFTCOUNTER1
	CMP SHIFTCOUNTER1, 12
	JB SHIFTLOOP2
SHIFTLOOP3:
	CALL SHIFTLOOP1
	CALL DELAY
	CALL CLEARSCREEN
	SUB INITTOPBOTLEFTCX ,10
	SUB INITCMPTOPBOT ,10
	SUB INITRIGHTCX ,10
	INC SHIFTCOUNTER2
	CMP SHIFTCOUNTER2, 24
	JB SHIFTLOOP3
	
SHIFTLOOP1 PROC	
	MOV CX, INITTOPBOTLEFTCX  	
	MOV DX, INITTOPLEFTRIGHTDX  	 
	MOV AX, 0C02h 	
	TOPSQSHIFT: INT 10h 	 
	INC CX 			
	CMP CX, INITCMPTOPBOT   	 
	JB TOPSQSHIFT 		
	
	MOV CX, INITTOPBOTLEFTCX 
	MOV DX, INITBOTDX 
	MOV AX, 0C02H
	BOTSQSHIFT: INT 10H
	INC CX
	CMP CX, INITCMPTOPBOT 
	JB BOTSQSHIFT
	
	MOV CX, INITTOPBOTLEFTCX 
	MOV DX, INITTOPLEFTRIGHTDX 
	MOV AX, 0C02H
	LEFTSQSHIFT:INT 10H
	INC DX
	CMP DX, INITCMPLEFTRIGHT 
	JB LEFTSQSHIFT
	
	MOV CX, INITRIGHTCX 
	MOV DX, INITTOPLEFTRIGHTDX 
	MOV AX, 0C02H
	RIGHTSQSHIFT:INT 10H
	INC DX
	CMP DX, INITCMPLEFTRIGHT 
	JB RIGHTSQSHIFT
	RET
SHIFTLOOP1 ENDP	
RET
SQUARESHIFT ENDP
COMBICHANGECOLOR PROC
CHANGECOLORLOOP:
	CALL CHANGECOLORHOUSE
	CALL DELAY
	INC trianglecolor 
	INC squarecolor 
	INC doorcolor 
	INC changecolorcount1
	CMP changecolorcount1,10
	JB CHANGECOLORLOOP
CHANGECOLORHOUSE PROC	
	; SQUARE 
	MOV CX, 220 	 
	MOV DX, 240 	
	MOV AH, 0CH
	MOV AL, squarecolor 	
	TOPSQCHANGECOLOR: INT 10h 	
	INC CX 			
	CMP CX, 420  	
	JB TOPSQCHANGECOLOR 		
	
	MOV CX, 220
	MOV DX, 440
	MOV AH, 0CH
	MOV AL, squarecolor 	
	BOTSQCHANGECOLOR: INT 10H
	INC CX
	CMP CX, 420
	JB BOTSQCHANGECOLOR
	
	MOV CX, 220
	MOV DX, 240
	MOV AH, 0CH
	MOV AL, squarecolor 	 
	LEFTSQCHANGECOLOR:INT 10H
	INC DX
	CMP DX, 440
	JB LEFTSQCHANGECOLOR
	
	MOV CX, 420
	MOV DX, 240
	MOV AH, 0CH
	MOV AL, squarecolor 	
	RIGHTSQCHANGECOLOR:INT 10H
	INC DX
	CMP DX, 440
	JB RIGHTSQCHANGECOLOR
	;TRIANGLE
	MOV CX, 320 	
	MOV DX, 70 	
	MOV AH, 0CH
	MOV AL, trianglecolor 	
	RIGHTTRCHANGECOLOR: INT 10h 	
	INC CX 			
	INC DX
	CMP DX, 240  	
	JB RIGHTTRCHANGECOLOR 		

	MOV CX, 320 	
	MOV DX, 70 	
	MOV AH, 0CH
	MOV AL, trianglecolor 	
	LEFTTRCHANGECOLOR: INT 10h 	
	DEC CX 			
	INC DX
	CMP DX, 240  	
	JB LEFTTRCHANGECOLOR 		

	MOV CX, 150	 	
	MOV DX, 240 	
	MOV AH, 0CH
	MOV AL, trianglecolor  
	BOTTRCHANGECOLOR: INT 10h 	
	INC CX
	CMP CX, 490  	
	JB BOTTRCHANGECOLOR 		
	;DOOR
	MOV CX, 280 	 
	MOV DX, 360 	
	MOV AH, 0CH
	MOV AL, doorcolor 	 
	DOORTPCHANGECOLOR: INT 10h 	 
	INC CX 			
	CMP CX, 360  	 
	JB DOORTPCHANGECOLOR 		 
	
	MOV CX, 280
	MOV DX, 360
	MOV AH, 0CH
	MOV AL, doorcolor 	
	DOORLEFTCHANGECOLOR:INT 10H
	INC DX
	CMP DX, 440
	JB DOORLEFTCHANGECOLOR
	
	MOV CX, 360
	MOV DX, 360
	MOV AH, 0CH
	MOV AL, doorcolor 	
	DOORRIGHTCHANGECOLOR:INT 10H
	INC DX
	CMP DX, 440
	JB DOORRIGHTCHANGECOLOR
	RET
CHANGECOLORHOUSE ENDP
COMBICHANGECOLOR ENDP
TEST1 PROC
	mov ah, 09h
	mov dx, offset sentence
	int 21h
	mov ah,02h
	mov dh,01h
	mov dl,00h
	int 10h
	mov ah, 09h
	mov dx, offset sentence2
	int 21h
trap:	
	MOV AH, 08h
	INT 21h 
	MOV DL, AL
testA:
	CMP DL, "a"
	jne testB
	mov ah,02h
	mov dh,03h
	mov dl,00h
	int 10h
	mov ah, 09h
	mov dx, offset sentence1
	int 21h
	CALL TEST2BASIC
	RET
testB:
	CMP DL, "b"
	jne testC
	CALL COMBISHAPES
	CALL PRESSANYKEY
	RET
testC:
	CMP DL, "c"
	jne testD
	CALL COMBICOLORS
	CALL PRESSANYKEY	
	RET
testD:
	CMP DL, "d"
	jne testE
	CALL TRIANGLEROTATE
	CALL PRESSANYKEY	
	RET
testE:
	CMP DL, "e"
	jne testF
	CALL SQUARESHIFT
	CALL PRESSANYKEY	
	RET
testF:
	CMP DL, "f"
	jne testG
	CALL COMBICHANGECOLOR
	CALL PRESSANYKEY	
	RET
testG:
	CMP DL, 01BH
	jne trap
	MOV AX, 4C00H 	; Exit to DOS function 
	INT 21H	
TEST1 ENDP
TEST2BASIC PROC
trap2:	
	MOV AH, 08h
	INT 21h 
	MOV DL, AL
testABASIC:
	CMP DL, "a"
	jne testBBASIC
	CALL BSQUARE
	CALL PRESSANYKEY
	RET
testBBASIC:
	CMP DL, "b"
	jne trap2
	CALL BTRIANGLE
	CALL PRESSANYKEY
	RET	
TEST2BASIC ENDP
end start