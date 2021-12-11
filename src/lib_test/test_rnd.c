// unit tests for z-fighter library
// by xrrawva 2021

void testRndReturnValueCount(unsigned char useRndImprove)
{
    color = 1;
    cls();

    unsigned char returnValueCount[128];
    for(unsigned char i=0;i<128;i++)returnValueCount[i]=0;

    unsigned char fakeUnpredictableByte=0;
    unsigned char thisReturnValueCount=0;
    while(thisReturnValueCount<64)
    {
        if(useRndImprove)
        {
            fakeUnpredictableByte++;
            if((fakeUnpredictableByte&15)==0)rndImprove(20+(fakeUnpredictableByte>>5));
        }

        unsigned char thisReturnValue=rnd(127);
        thisReturnValueCount=returnValueCount[thisReturnValue];
        thisReturnValueCount++;
        returnValueCount[thisReturnValue]=thisReturnValueCount;
        point(thisReturnValue,64-thisReturnValueCount);
    }
    lcd(screen);
}

unsigned char testRndReturnValuesInRange()
{
    unsigned char param=0;
    do
    {
        //uint16_t seed=0; // for all  possible rnd() results
        uint8_t seed=0;    // for some possible rnd() results
        do
        {
            //srand(seed); // for all  possible rnd() results
            if(rnd(param)>param)return FALSE;
            seed++;
        }
        while(seed!=0);
        if(param&1)showProgress((unsigned char)( ((unsigned int)param*100)/255 ));
        param++;
    }
    while(param!=0);
    return TRUE;
}
