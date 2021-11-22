#ifndef POKER_H
#define POKER_H

#define TWO         1
#define THREE       2
#define FOUR        3
#define FIVE        4
#define SIX         5
#define SEVEN       6
#define EIGHT       7
#define NINE        8
#define TEN         9
#define JACK        10
#define QUEEN       11
#define KING        12
#define ACE         13

#define CLUBS       0
#define DIAMONDS    1
#define HEARTS      2
#define SPADES      3

extern unsigned int cred;
extern unsigned char bet;
extern unsigned char hand[];

void screenTitle();
void screenGame();
void gameInit();
void printCred();

// Graphics

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