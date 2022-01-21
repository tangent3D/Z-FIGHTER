// space shooter game for z-fighter
// by xrrawva 2021

#include <zf_gfx.h>
#include <zf_lcd.h>
#include "mode_game.h"
#include "mode_gameover.h"
#include "mode_title.h"
#include "mode_win.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

void main()
{
    unsigned char run=TRUE;
    while(run)
    {
        run=modeTitle();
        if(run)
        {
            showTextPage(//"1234567812345678\n"
                           "It is the year\n"
                           "we cannot name\n"
                           "because in this\n"
                           "distant future\n"
                           "efforts of\n"
                           "tracking non-\n"
                           "relative time\n"
                           "have long been");
            showTextPage(//"1234567812345678\n"
                           "given up on. Use\n"
                           "one of the high-\n"
                           "tech mechs to\n"
                           "travel space and\n"
                           "arrive in time\n"
                           "for Captain\n"
                           "Tangent's\n"
                           "birthday.");
            fadeToBlack();
            unsigned char win=modeGame();
            if(win)modeWin();
            else   modeGameOver();
        }
    }
    color=1;
    cls();
    lcd(screen);
}
