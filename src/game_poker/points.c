// module implementation for z-fighter game "poker"
// by xrrawva 2021

#include "points.h"

unsigned char isFlush();
void getCardCountByValue(unsigned char* cardCountByValue);
unsigned char isStraight(unsigned char* cardCountByValue);
unsigned char hasThreeOfAKind(unsigned char* cardCountByValue);
unsigned char getPairCount(unsigned char* cardCountByValue);

int getHandPoints(unsigned char bet)
{
	// TODO: sort returns by correct priority! by highest result?
	// currently sorted by order of appearance in screenshot

	// generate statistics 1/2
	unsigned char flush=isFlush();
	unsigned char cardCountByValue[13];
	getCardCountByValue(cardCountByValue);
	unsigned char straight=isStraight(cardCountByValue);

	// royal flush?
	if( straight && flush && cardCountByValue[ACE]==1 && cardCountByValue[KING]==1 )
	{
		if(bet==5)return 4000;
		else      return bet*250;
	}

	// straight flush?
	if( straight && flush )return bet*50;

    // 4 of a kind (a) with 2,3,4?
    if( cardCountByValue[ACE]==4 )
    {
        if( cardCountByValue[TWO  ]==1 ||
            cardCountByValue[THREE]==1 ||
            cardCountByValue[FOUR ]==1 )return bet*320;
    }

    // 4 of a kind (a) with j,q,k?
    if( cardCountByValue[ACE]==4 )
    {
        if( cardCountByValue[JACK ]==1 ||
            cardCountByValue[QUEEN]==1 ||
            cardCountByValue[KING ]==1 )return bet*320;
    }

    // 4 of a kind (2,3,4) with a,2,3,4?
    if( cardCountByValue[TWO  ]==4 ||
        cardCountByValue[THREE]==4 ||
        cardCountByValue[FOUR ]==4 )
    {
        if( cardCountByValue[ACE  ]==1 ||
            cardCountByValue[TWO  ]==1 ||
            cardCountByValue[THREE]==1 ||
            cardCountByValue[FOUR ]==1 )return bet*160;
    }

    // 4 of a kind (j,q,k) with j,q,k,a?
    if( cardCountByValue[JACK ]==4 ||
        cardCountByValue[QUEEN]==4 ||
        cardCountByValue[KING ]==4 )
    {
        if( cardCountByValue[JACK ]==1 ||
            cardCountByValue[QUEEN]==1 ||
            cardCountByValue[KING ]==1 ||
            cardCountByValue[ACE  ]==1 )return bet*160;
    }

    // 4 of a kind (a)?
	if( cardCountByValue[ACE]==4 )return bet*160;

    // 4 of a kind (2,3,4)?
    if( cardCountByValue[TWO  ]==4 ||
        cardCountByValue[THREE]==4 ||
        cardCountByValue[FOUR ]==4 )return bet*80;

    // 4 of a kind (5-k)?
    if( cardCountByValue[FIVE ]==4 ||
        cardCountByValue[SIX  ]==4 ||
        cardCountByValue[SEVEN]==4 ||
        cardCountByValue[EIGHT]==4 ||
        cardCountByValue[NINE ]==4 ||
        cardCountByValue[TEN  ]==4 ||
        cardCountByValue[JACK ]==4 ||
        cardCountByValue[QUEEN]==4 ||
        cardCountByValue[KING ]==4 )return bet*50;

	// generate statistics 2/2
	unsigned char threeOfAKind=hasThreeOfAKind(cardCountByValue);
	unsigned char pairCount=getPairCount(cardCountByValue);

	// full house?
	if( threeOfAKind && pairCount==1 )return bet*7;

	// flush?
	if( flush )return bet*5;

	// straight?
	if( straight )return bet*4;

	// 3 of a kind?
	if( threeOfAKind )return bet*3;

	// 2 pair?
	if( pairCount==2 )return bet;

	// jacks or better?
	if( cardCountByValue[JACK ]==2 ||
	    cardCountByValue[QUEEN]==2 ||
	    cardCountByValue[KING ]==2 ||
	    cardCountByValue[ACE  ]==2 )return bet;

	return 0;
}

unsigned char isFlush()
{
	for(unsigned char suit=0;suit<4;suit++)
	{
		if( deck[hand[0]].suit==suit &&
		    deck[hand[1]].suit==suit && 
		    deck[hand[2]].suit==suit && 
		    deck[hand[3]].suit==suit && 
		    deck[hand[4]].suit==suit )return TRUE;
	}
	return FALSE;
}

void getCardCountByValue(unsigned char* cardCountByValue)
{
	for(unsigned char value=0;value<13;value++)
	{
		unsigned char count=0;
		for(unsigned char iHand=0;iHand<5;iHand++)
		{
			if(deck[hand[iHand]].value==value)count++;
		}
		cardCountByValue[value]=count;
	}
}

unsigned char isStraight(unsigned char* cardCountByValue)
{
	unsigned char straightLength=0;
	if(cardCountByValue[ACE]==1)
	{
		// allows detection of {ace,2,3,4,5}
		straightLength++;
	}
	for(unsigned char value=0;value<13;value++)
	{
		if(cardCountByValue[value]==1)
		{
			straightLength++;
			if(straightLength==5)return TRUE;
		}
		else
		{
			straightLength=0;
		}
	}
	return FALSE;
}

unsigned char hasThreeOfAKind(unsigned char* cardCountByValue)
{
	for(unsigned char value=0;value<13;value++)
	{
		if(cardCountByValue[value]==3)
		{
			return TRUE;
		}
	}
	return FALSE;
}

unsigned char getPairCount(unsigned char* cardCountByValue)
{
	unsigned char result=0;
	for(unsigned char value=0;value<13;value++)
	{
		if(cardCountByValue[value]==2)result++;
	}
	return result;
}
