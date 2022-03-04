EXTERN	PORTA
EXTERN 	PORTB
EXTERN 	PORTC
EXTERN 	CTRL


SECTION code_user

LD 		A,90h
OUT 	(CTRL),A 	;Init PPI
LD		DE,0 		;Initialize destination address
LD 		BC,1536 	;Initialize byte counter

LOOP:
	LD		A,0 		;Byte to write to screen
	OUT		(PORTA),A

	LD		A,D
	OUT		(PORTB),A
	LD		A,0+1 		;Latch LU
	OUT		(CTRL),A

	LD 		A,E
	OUT 	(PORTB),A
	LD 		A,2+1 		;Latch LL
	OUT		(CTRL),A

	LD 		A,90h
	OUT 	(CTRL),A 	;Init PPI (should hopefully reset latches? may need to just reset them one by one for safety)

	DEC 	BC
	LD      A,C
	OR      B
	JP		NZ,LOOP
	RET