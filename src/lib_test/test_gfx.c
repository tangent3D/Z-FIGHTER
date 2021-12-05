// unit tests for z-fighter library
// by xrrawva 2021

void testGfxPositions()
{
    const unsigned char spBoxW[]={16,16,255,240,255,248,255,252,255,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,127,255,63,255,31,255,15,255};
    const unsigned char spBoxB[]={16,16,255,240,192,8,160,4,144,2,143,255,136,1,136,1,136,1,136,1,136,1,136,1,136,1,72,1,40,1,24,1,15,255};
    const unsigned char bpBox[]={255,129,129,129,129,129,129,255};

    // for both colors
    for(unsigned char c=1;c!=255;c--)
    {
        // main loop
        unsigned char frame=0;
        while(frame<70)
        {
            // move graphics
            unsigned char x=0;
            unsigned char y=0;
            if(frame>50)
            {
                x=frame-60;
                y=frame-60;
            }
            else if(frame>30)
            {
                y=frame-40;
            }
            else if(frame>10)
            {
                x=frame-20;
            }

            // cls
            color=c;
            cls();

            // point
            point(x+0,y+0);
            point(x+1,y+1);
            point(x+2,y+2);

            // line: straight
            lineFrom(x+ 0,y+64);
            lineTo  (x+ 0,y+32);
            lineTo  (x+32,y+32);

            // line: diagonal
            lineFrom(x+        32,y+        32);
            lineTo  (x+        64,y+SCREEN_H-1);
            lineFrom(x+         0,y+SCREEN_H-1);
            lineTo  (x+        64,y+         0);
            lineFrom(x+SCREEN_W-1,y+SCREEN_H-1);
            lineTo  (x+        64,y+         0);
            lineFrom(x+SCREEN_W-1,y+         0);
            lineTo  (x+        64,y+SCREEN_H-1);

            // rect
            rect (x+SCREEN_W-32   ,y+16  ,32,8);
            point(x+SCREEN_W-32- 1,y+16-1);
            point(x+SCREEN_W-32- 1,y+16+8);
            point(x+SCREEN_W-32+32,y+16-1);
            point(x+SCREEN_W-32+32,y+16+8);

            // sprite
            sprite           (spBoxW,x+32,y   );
            color=c;
            spriteTransparent(spBoxW,x+ 1,y+33);
            color=1-c;
            spriteTransparent(spBoxB,x+ 1,y+33);

            // block
            color=c;
            block(bpBox,x+8,y+4);

            lcd(screen);
            frame++;
        }
    }
}
