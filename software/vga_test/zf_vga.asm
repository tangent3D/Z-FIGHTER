EXTERN	PORTA
EXTERN 	PORTB
EXTERN 	PORTC
EXTERN 	CTRL


SECTION code_user

LD 		A,80h
OUT 	(CTRL),A 	;Init PPI
LD		DE,0 		;Initialize destination address
LD 		BC,1530h 	;Initialize byte counter

LOOP:
	LD		A,255h		;Byte to write to screen
	OUT		(PORTA),A

	LD 		A,D
	OUT 	(PORTC),A

	LD		A,E
	OUT		(PORTB),A

	LD  	A,9 	;WRDY active
	OUT 	(CTRL),A
	NOP
	LD  	A,8 		;WRDY inactive
	OUT 	(CTRL),A

	INC 	DE
	DEC 	BC
	LD      A,C
	OR      B
	JP		NZ,LOOP

RET