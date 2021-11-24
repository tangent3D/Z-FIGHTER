// module implementation for z-fighter game "poker"
// by xrrawva 2021

#include "points.h"

unsigned char isFlush();
void getCardCountByValue(unsigned char* cardCountByValue);
unsigned char isStraight(unsigned char* cardCountByValue);
unsigned char hasThreeOfAKind(unsigned char* cardCountByValue);
unsigned char getCountOfTwoOfAKind(unsigned char* cardCountByValue);

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
	if( straight && flush && cardCountByValue[ACE]==1 )
	{
		if(bet==5)return 4000;
		else      return bet*250;
	}

	// straight flush?
	if( straight && flush )return bet*50;

	// TODO: ...

	// 4 aces?
	if( cardCountByValue[ACE]==4 )return bet*160;

	// TODO: ...

	// generate statistics 2/2
	unsigned char threeOfAKind=hasThreeOfAKind(cardCountByValue);
	unsigned char countOfTwoOfAKind=getCountOfTwoOfAKind(cardCountByValue);

	// full house?
	if( threeOfAKind && countOfTwoOfAKind==1 )return bet*7;

	// flush?
	if( flush )return bet*5;

	// straight?
	if( straight )return bet*4;

	// 3 of a kind?
	if( threeOfAKind )return bet*3;

	// 2 pair?
	if( countOfTwoOfAKind==2 )return bet;

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

unsigned char getCountOfTwoOfAKind(unsigned char* cardCountByValue)
{
	unsigned char result=0;
	for(unsigned char value=0;value<13;value++)
	{
		if(cardCountByValue[value]==2)result++;
	}
	return result;
}
