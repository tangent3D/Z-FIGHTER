// unit tests for z-fighter library
// by xrrawva 2021

#include <stdlib.h>
#include <zf_gfx.h>
#include <zf_keypad.h>
#include <zf_lcd.h>
#include <zf_text.h>
#include "test.h"
#include "test_rnd.h"
#include "test_gfx.h"

void main()
{
    showInfoPage((unsigned char*)"RndRetCount\n   (x)(y)");
    pressAnyKey();
    testRndReturnValueCount(FALSE);
    pressAnyKey();

    showInfoPage((unsigned char*)"RndRetCountImpvd\n   (x)(y)");
    pressAnyKey();
    testRndReturnValueCount(TRUE);
    pressAnyKey();

    showInfoPage((unsigned char*)"RndRetValInRange");
    showResult(testRndReturnValuesInRange());
    pressAnyKey();

    showInfoPage((unsigned char*)"GfxPositions");
    pressAnyKey();
    testGfxPositions();
    pressAnyKey();

    color = 1;
    cls();
    lcd(screen);
}

void showInfoPage(const unsigned char* testName)
{
    color = 1;
    cls();
    print((unsigned char*)"TEST:\n \n \nPROGRESS:-\nRESULT:  ?",0,0);
    print((unsigned char*)testName,0,1);
    lcd(screen);
}

void showProgress(unsigned char percent)
{
    color = 1;
    unsigned char str[4];
    utoa(percent,str,10);
    print(str,9,3);
    if     (percent>99)print((unsigned char*)"%",12,3);
    else if(percent> 9)print((unsigned char*)"%",11,3);
    else               print((unsigned char*)"%",10,3);
    lcd(screen);
}

void showResult(unsigned char isOk)
{
    showProgress(100);
    if(isOk)print((unsigned char*)"Ok"    ,9,4);
    else    print((unsigned char*)"Failed",9,4);
    lcd(screen);
}

void pressAnyKey()
{
    color = 1;
    print((unsigned char*)"Press any key   ",0,7);
    lcd(screen);
    while(key(KEY_ANY));
    while(!key(KEY_ANY));
    print((unsigned char*)"                ",0,7);
    lcd(screen);
}
