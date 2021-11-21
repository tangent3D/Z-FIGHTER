#include <zf_gfx.h>
#include <zf_lcd.h>


#define TWO			1
#define THREE		2
#define FOUR		3
#define FIVE		4
#define SIX			5
#define SEVEN		6
#define EIGHT		7
#define NINE		8
#define TEN			9
#define JACK		10
#define QUEEN		11
#define KING		12
#define ACE			13

#define CLUBS		0
#define DIAMONDS	1
#define HEARTS		2
#define SPADES		3

void main()
{

}

struct card
{
	unsigned char value;
	unsigned char suit;
	unsigned char dealt;
}

struct card deck[52] =
{
	{ TWO,	 CLUBS, 0 },
	{ THREE, CLUBS, 0 },
	{ FOUR,  CLUBS, 0 },
	{ FIVE,  CLUBS, 0 },
	{ SIX, 	 CLUBS, 0 },
	{ SEVEN, CLUBS, 0 },
	{ EIGHT  CLUBS, 0 },
	{ NINE,  CLUBS, 0 },
	{ TEN,   CLUBS, 0 },
	{ JACK,  CLUBS, 0 },
	{ QUEEN, CLUBS, 0 },
	{ KING,  CLUBS, 0 },
	{ ACE,   CLUBS, 0 },

	{ TWO,	 DIAMONDS, 0 },
	{ THREE, DIAMONDS, 0 },
	{ FOUR,  DIAMONDS, 0 },
	{ FIVE,  DIAMONDS, 0 },
	{ SIX, 	 DIAMONDS, 0 },
	{ SEVEN, DIAMONDS, 0 },
	{ EIGHT  DIAMONDS, 0 },
	{ NINE,  DIAMONDS, 0 },
	{ TEN,   DIAMONDS, 0 },
	{ JACK,  DIAMONDS, 0 },
	{ QUEEN, DIAMONDS, 0 },
	{ KING,  DIAMONDS, 0 },
	{ ACE,   DIAMONDS, 0 },

	{ TWO,	 HEARTS, 0 },
	{ THREE, HEARTS, 0 },
	{ FOUR,  HEARTS, 0 },
	{ FIVE,  HEARTS, 0 },
	{ SIX, 	 HEARTS, 0 },
	{ SEVEN, HEARTS, 0 },
	{ EIGHT  HEARTS, 0 },
	{ NINE,  HEARTS, 0 },
	{ TEN,   HEARTS, 0 },
	{ JACK,  HEARTS, 0 },
	{ QUEEN, HEARTS, 0 },
	{ KING,  HEARTS, 0 },
	{ ACE,   HEARTS, 0 },

	{ TWO,	 SPADES, 0 },
	{ THREE, SPADES, 0 },
	{ FOUR,  SPADES, 0 },
	{ FIVE,  SPADES, 0 },
	{ SIX, 	 SPADES, 0 },
	{ SEVEN, SPADES, 0 },
	{ EIGHT  SPADES, 0 },
	{ NINE,  SPADES, 0 },
	{ TEN,   SPADES, 0 },
	{ JACK,  SPADES, 0 },
	{ QUEEN, SPADES, 0 },
	{ KING,  SPADES, 0 },
	{ ACE,   SPADES, 0 },	
};

// Graphics

const unsigned char spriteTwo[] = {10,14,63,31,238,31,3,0,192,115,253,254,224,48,12,3,0,255,255,240};
const unsigned char spriteThree[] = {10,14,63,31,238,31,3,0,192,112,248,62,1,192,60,15,135,127,143,192};
const unsigned char spriteFour[] = {10,14,3,1,192,240,124,59,28,206,51,12,255,255,240,48,12,3,0,192};
const unsigned char spriteFive[] = {10,14,255,255,252,3,0,255,191,240,28,3,0,192,60,15,135,127,143,192};
const unsigned char spriteSix[] = {10,14,63,31,238,31,3,192,48,15,243,254,193,240,60,15,135,127,143,192};
const unsigned char spriteSeven[] = {10,14,255,255,240,12,3,1,192,224,112,56,12,3,0,192,48,12,3,0};
const unsigned char spriteEight[] = {10,14,63,31,238,31,3,192,248,119,249,254,225,240,60,15,135,127,143,192};
const unsigned char spriteNine[] = {10,14,63,31,238,31,3,192,248,55,252,255,0,192,60,15,135,127,143,192};
const unsigned char spriteTen[] = {17,14,48,126,56,127,188,112,254,48,51,24,25,140,12,198,6,99,3,49,129,152,192,204,96,102,56,127,207,247,227,240};
const unsigned char spriteJack[] = {10,14,15,195,240,48,12,3,0,192,48,12,3,0,204,51,156,126,15,0};
const unsigned char spriteQueen[] = {10,14,63,31,238,31,3,192,240,60,15,3,204,243,188,127,142,127,207,176};
const unsigned char spriteKing[] = {10,14,193,176,236,115,56,220,62,15,3,224,220,51,140,115,14,193,240,48};
const unsigned char spriteAce[] = {10,14,12,7,131,241,206,225,240,60,15,3,255,255,252,15,3,192,240,48};

const unsigned char spriteClubs[] = {11,11,14,3,224,124,15,134,237,255,255,255,255,117,193,192,124,0};
const unsigned char spriteDiamonds[] = {11,11,4,1,64,68,16,68,5,0,80,17,4,17,1,64,16,0};
const unsigned char spriteHearts[] = {11,11,49,137,74,16,192,24,3,0,80,17,4,17,1,64,16,0};
const unsigned char spriteSpades[] = {11,11,4,1,192,124,31,199,253,255,255,255,255,117,193,192,124,0};

const unsigned char spriteFront[] = {24,32,63,255,252,64,0,2,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,64,0,2,63,255,252};
const unsigned char spriteRear[] = {24,32,63,255,252,64,0,2,159,255,249,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,184,0,61,184,0,125,184,120,221,184,241,157,185,227,29,191,198,61,191,140,125,191,24,253,190,49,253,188,99,157,184,199,29,185,142,29,187,0,29,190,0,29,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,159,255,249,64,0,2,63,255,252};
const unsigned char spriteHeld[] = {18,5,167,33,169,8,94,98,22,144,133,167,57,128};

const unsigned char* gfxValue[] =
{
	spriteTwo,
	spriteThree,
	spriteFour,
	spriteFive,
	spriteSix,
	spriteSeven,
	spriteEight,
	spriteNine,
	spriteTen,
	spriteJack,
	spriteQueen,
	spriteKing,
	spriteAce
};

const unsigned char* gfxSuit[] =
{
	spriteClubs,
	spriteDiamonds,
	spriteHearts,
	spriteSpades
};