#ifndef POKER_H
#define POKER_H

#define TWO         0
#define THREE       1
#define FOUR        2
#define FIVE        3
#define SIX         4
#define SEVEN       5
#define EIGHT       6
#define NINE        7
#define TEN         8
#define JACK        9
#define QUEEN       10
#define KING        11
#define ACE         12

#define CLUBS       0
#define DIAMONDS    1
#define HEARTS      2
#define SPADES      3

extern unsigned int cred;
extern unsigned char bet;
extern unsigned char hand[];
extern unsigned char held[];
extern struct card deck[];

struct card
{
    unsigned char value;
    unsigned char suit;
    unsigned char dealt;
};

void initGame();
void initScreen();
void printCred();
void placeCards();
void play();
void dealDraw();
void resetCards();
void gameOver();
void hold();
void holdCard(unsigned char i);
void draw();
void revealHand();
void revealCard(unsigned char i);
void randomCard(unsigned char i);
unsigned char rnd(unsigned char maxValue);

// Graphics

#define HAND_X 			2
#define HAND_Y 			13
#define CARD_OFFSET 	25

extern const unsigned char spriteTwo[];
extern const unsigned char spriteThree[];
extern const unsigned char spriteFour[];
extern const unsigned char spriteFive[];
extern const unsigned char spriteSix[];
extern const unsigned char spriteSeven[];
extern const unsigned char spriteEight[];
extern const unsigned char spriteNine[];
extern const unsigned char spriteTen[];
extern const unsigned char spriteJack[];
extern const unsigned char spriteQueen[];
extern const unsigned char spriteKing[];
extern const unsigned char spriteAce[];

extern const unsigned char spriteClubs[];
extern const unsigned char spriteDiamonds[];
extern const unsigned char spriteHearts[];
extern const unsigned char spriteSpades[];

extern const unsigned char spriteCardFront[];
extern const unsigned char spriteCardBack[];
extern const unsigned char spriteHeld[];

extern const unsigned char* gfxValues[];
extern const unsigned char* gfxSuits[];

#endif