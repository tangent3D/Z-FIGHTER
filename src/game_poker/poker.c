#include <stdlib.h>
#include <z80.h>
#include <string.h>
#include <zf_gfx.h>
#include <zf_lcd.h>
#include <zf_keypad.h>
#include <zf_buzzer.h>
#include <zf_text.h>
#include "poker.h"
#include "points.c"

unsigned int cred;
unsigned char bet;
unsigned char hand[5];
unsigned char held[5];
unsigned char holdPhase;

#define CRED_INIT   20
#define BET_INIT    1
#define BET_MAX     5

void main()
{
    initGame();
    initScreen();

    for (;;)
    {
        newRound();
        dealDraw();

        hold();
        dealDraw();

        resetCards();

        // check for winning hand?
    }
}

void initGame()
{
    cred = CRED_INIT;
    bet = BET_INIT;
}

void initScreen()
{
    backlight = 1;

    // Display screen text
    unsigned char textBet[] = "BET";

    // Display credit value
    printChar('$', 11, 0);
    printCred();

    // Display bet value
    print(textBet, 12, 7);
    printChar('0' + bet, 15, 7);

    // Render five face-down cards
    placeCards();
}

void newRound()
{
    // Check for victory
    if (cred == 9999)
    {
        gameWin();
    }

    // Check for game over
    if (cred == 0)
    {
        gameOver();
    }

    // Display 'BET/DEAL' status text
    unsigned char textBetDeal[] = "BET/DEAL ";
    print(textBetDeal, 0, 7);
    lcd(screen);

    // Respond to user input
    for (;;)
    {
        // Change bet amount
        if (key(KEY_C))
        {
            if (bet != BET_MAX)
            {
                bet++;
            }
            else
            {
                bet = 1;
            }

        // Wait for key up
        while (key(KEY_C));
        printChar('0'+bet, 15, 7);
        lcd(screen);
        buzzer(32, 16);
        }

        // Deal/draw
        if (key(KEY_D))
        {
            // Wait for key up
            while (key(KEY_D));
            if (cred >= bet)
            {
                break;                
            }
        }
    }

    // Clear 'HELD' sprites if exist
    if (holdPhase == TRUE)
    {
        color = 0;
        rect(5, 46, 118, 5);
        color = 1;
        holdPhase = FALSE;
    }

    cred = cred - bet;
    printCred();
}

void placeCards()
{
    // Render face-down cards
    for (unsigned char i = 0; i<=4; i++)
    {
        if (held[i] == FALSE)
        {
            // FIXME: optimize?
            sprite(spriteCardBack, HAND_X+CARD_OFFSET*i, HAND_Y);
        }
    }

    lcd(screen);
}

void printCred()
{
    unsigned char arrScore[4];
    utoa(cred, arrScore, 10);
    unsigned char offset = 4 - strlen(arrScore);
    const unsigned char counter[] = "0000";
    print(counter, 12, 0);
    print(arrScore, 12+offset, 0);
}

void dealDraw()
{
    placeCards();

    for (unsigned char i = 0; i <= 4; i++)
    {
        if (held[i] == FALSE)
        {
            randomCard(i);
        }
    }

    revealHand();
}

void hold()
{
    holdPhase = TRUE;
    unsigned char textHold[] = "HOLD    ";
    print(textHold, 0, 7);
    lcd(screen);

    for (;;)
    {
        if (key(KEY_LEFT))
        {
            while (key(KEY_LEFT));
            holdCard(0);
        }

        if (key(KEY_UP))
        {
            while (key(KEY_UP));
            holdCard(1);
        }

        if (key(KEY_RIGHT))
        {
            while (key(KEY_RIGHT));
            holdCard(2);
        }

        if (key(KEY_A))
        {
            while (key(KEY_A));
            holdCard(3);
        }

        if (key(KEY_B))
        {
            while (key(KEY_B));
            holdCard(4);
        }

        if (key(KEY_D))
        {
            while (key(KEY_D));
            break;
        }
    }
}

void holdCard(unsigned char i)
{
    if (held[i] == FALSE)
    {
        held[i] = TRUE;
        sprite(spriteHeld, 5 + (25 * i), 46);

    }
    else
    {
        held[i] = FALSE;
        color = 0;
        rect((5 + (25 * i)), 46, 18, 5);
        color = 1;
    }
    
    lcd(screen);
    buzzer(32, 16);
}

void resetCards()
{
    // Reset held cards
    for (unsigned char i = 0; i <= 4; i++)
    {
        held[i] = FALSE;
    }
    // Reset dealt cards
    for (unsigned char i = 0; i <= 51; i++)
    {
        deck[i].dealt = FALSE;
    }
}

void gameOver()
{
    // Display 'GAME OVER' status text
    unsigned char textGameOver[] = "GAME OVER";
    print(textGameOver, 0, 7);
    lcd(screen);
    buzzer(NOTE_G3);
    buzzer(NOTE_E3);
    buzzer(NOTE_C3);
    for (;;)
    {
        if (key(KEY_D))
        {
            main();
        }
    }
}

void gameWin()
{
    // Display "YOU WIN" status text
    unsigned char textYouWin[] = "YOU WIN!";
    print(textYouWin, 0, 7);
    lcd(screen);
    for (;;)
    {
        if (key(KEY_D))
        {
            main();
        }
    }
}

unsigned char rnd(unsigned char maxValue)
{
    unsigned char result;

    do
    {
        result=rand();
    } while (result>maxValue);

    return result;
}

void randomCard(unsigned char i)
{
    unsigned char j;

    do
    {
        j = rnd(51);
    } while (deck[j].dealt == TRUE);

    hand[i] = j;
    deck[i].dealt = TRUE;
}

void revealHand()
{
    for (unsigned char i = 0; i<=4; i++)
    {
        if (held[i] == FALSE)
        {
            revealCard(i);
            buzzer(16,1);
            lcd(screen);
        }
    }
}

//FIXME: terrible
void revealCard(unsigned char i)
{
    switch(i)
    {
        case 0 :
            sprite(spriteCardFront, HAND_X, HAND_Y);
            sprite(gfxValues[deck[hand[i]].value], (HAND_X+CARD_OFFSET*0)+2, HAND_Y+2);
            sprite(gfxSuits[deck[hand[i]].suit], (HAND_X+CARD_OFFSET*0)+11, HAND_Y+19);
            break;
        case 1 :
            sprite(spriteCardFront, HAND_X+CARD_OFFSET, HAND_Y);
            sprite(gfxValues[deck[hand[i]].value], (HAND_X+CARD_OFFSET*1)+2, HAND_Y+2);
            sprite(gfxSuits[deck[hand[i]].suit], (HAND_X+CARD_OFFSET)+11, HAND_Y+19);
            break;
        case 2 :
            sprite(spriteCardFront, HAND_X+CARD_OFFSET*2, HAND_Y);
            sprite(gfxValues[deck[hand[i]].value], (HAND_X+CARD_OFFSET*2)+2, HAND_Y+2);
            sprite(gfxSuits[deck[hand[i]].suit], (HAND_X+CARD_OFFSET*2)+11, HAND_Y+19);
            break;
        case 3 :
            sprite(spriteCardFront, HAND_X+CARD_OFFSET*3, HAND_Y);
            sprite(gfxValues[deck[hand[i]].value], (HAND_X+CARD_OFFSET*3)+2, HAND_Y+2);
            sprite(gfxSuits[deck[hand[i]].suit], (HAND_X+CARD_OFFSET*3)+11, HAND_Y+19);
            break;
        case 4 :
            sprite(spriteCardFront, HAND_X+CARD_OFFSET*4, HAND_Y);
            sprite(gfxValues[deck[hand[i]].value], (HAND_X+CARD_OFFSET*4)+2, HAND_Y+2);
            sprite(gfxSuits[deck[hand[i]].suit], (HAND_X+CARD_OFFSET*4)+11, HAND_Y+19);
            break;
    }
}

struct card deck[52] =
{
    { TWO,   CLUBS, 0 },
    { THREE, CLUBS, 0 },
    { FOUR,  CLUBS, 0 },
    { FIVE,  CLUBS, 0 },
    { SIX,   CLUBS, 0 },
    { SEVEN, CLUBS, 0 },
    { EIGHT, CLUBS, 0 },
    { NINE,  CLUBS, 0 },
    { TEN,   CLUBS, 0 },
    { JACK,  CLUBS, 0 },
    { QUEEN, CLUBS, 0 },
    { KING,  CLUBS, 0 },
    { ACE,   CLUBS, 0 },

    { TWO,   DIAMONDS, 0 },
    { THREE, DIAMONDS, 0 },
    { FOUR,  DIAMONDS, 0 },
    { FIVE,  DIAMONDS, 0 },
    { SIX,   DIAMONDS, 0 },
    { SEVEN, DIAMONDS, 0 },
    { EIGHT, DIAMONDS, 0 },
    { NINE,  DIAMONDS, 0 },
    { TEN,   DIAMONDS, 0 },
    { JACK,  DIAMONDS, 0 },
    { QUEEN, DIAMONDS, 0 },
    { KING,  DIAMONDS, 0 },
    { ACE,   DIAMONDS, 0 },

    { TWO,   HEARTS, 0 },
    { THREE, HEARTS, 0 },
    { FOUR,  HEARTS, 0 },
    { FIVE,  HEARTS, 0 },
    { SIX,   HEARTS, 0 },
    { SEVEN, HEARTS, 0 },
    { EIGHT, HEARTS, 0 },
    { NINE,  HEARTS, 0 },
    { TEN,   HEARTS, 0 },
    { JACK,  HEARTS, 0 },
    { QUEEN, HEARTS, 0 },
    { KING,  HEARTS, 0 },
    { ACE,   HEARTS, 0 },

    { TWO,   SPADES, 0 },
    { THREE, SPADES, 0 },
    { FOUR,  SPADES, 0 },
    { FIVE,  SPADES, 0 },
    { SIX,   SPADES, 0 },
    { SEVEN, SPADES, 0 },
    { EIGHT, SPADES, 0 },
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

const unsigned char spriteCardFront[] = {24,32,63,255,252,64,0,2,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,128,0,1,64,0,2,63,255,252};
const unsigned char spriteCardBack[] = {24,32,63,255,252,64,0,2,159,255,249,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,184,0,61,184,0,125,184,120,221,184,241,157,185,227,29,191,198,61,191,140,125,191,24,253,190,49,253,188,99,157,184,199,29,185,142,29,187,0,29,190,0,29,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,191,255,253,159,255,249,64,0,2,63,255,252};
const unsigned char spriteHeld[] = {18,5,167,33,169,8,94,98,22,144,133,167,57,128};

const unsigned char* gfxValues[] =
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

const unsigned char* gfxSuits[] =
{
    spriteClubs,
    spriteDiamonds,
    spriteHearts,
    spriteSpades
};