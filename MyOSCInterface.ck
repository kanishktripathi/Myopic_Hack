
    OscRecv recv;
    5000 => recv.port;
    
    recv.listen();
    recv.event("/orientation/1 f") @=> OscEvent s1Thread;
    recv.event("/orientation/2 f") @=> OscEvent s2Thread;
    recv.event("/orientation/3 f") @=> OscEvent s3Thread;
    recv.event("/gyro/1 f") @=> OscEvent s4Thread;
    recv.event("/gyro/2 f") @=> OscEvent s5Thread;
    recv.event("/gyro/3 f") @=> OscEvent s6Thread;
    recv.event("/accel/1 f") @=> OscEvent s7Thread;
    recv.event("/accel/2 f") @=> OscEvent s8Thread;
    recv.event("/acccel/3 f") @=> OscEvent s9Thread;
    
    0 => float s1Val;
    0 => float s2Val;
    0 => float s3Val;
    0 => float s4Val;
    0 => float s5Val;
    0 => float s6Val;
    0 => float s7Val;
    0 => float s8Val;
    0 => float s9Val;
    
    
    fun void getS1Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s1Val;          
            }
        }
    }
    
    
    fun void getS2Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s2Val;
            }
        }
    }
    
    fun void getS3Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s3Val;
            }
        }
    }
    
    fun void getS4Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s4Val;
            }
        }
    }
    
    fun void getS5Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s5Val;
            }
        }
    }
    
    fun void getS6Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s6Val;
            }
        }
    }
    
    fun void getS7Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s7Val;
            }
        }
    }
    
    fun void getS8Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s8Val;
            }
        }
    }
    
    fun void getS9Val(OscEvent evnt)
    {
        while(true)
        {
            evnt => now;
            while(evnt.nextMsg() != 0)
            {
                evnt.getFloat() => s9Val;
            }
        }
    }
    
   `
    spork~getS1Val(s1Thread);
    spork~getS2Val(s2Thread);
    spork~getS3Val(s3Thread);
    spork~getS4Val(s4Thread);
    spork~getS5Val(s5Thread);
    spork~getS6Val(s6Thread);
    spork~getS7Val(s7Thread);
    spork~getS8Val(s8Thread);
    spork~getS9Val(s9Thread);
    
    FilteredInstrument fullmix;
    
    me.sourceDir() + "/Samples/FullMix.wav" => string filename;
    fullmix.setSoundFile(filename);
    fullmix.connect(dac);
    
    
    
    // the patch 
    //SndBuf buf => dac;
    // load the file
    //filename => buf.read;
    
    fullmix.setPos(0);
    
    // time loop
    while( true )
    {
        //Math.random2f(.2,.5) => buf.gain;
        fullmix.setGain(0.5);
         => fullmix.setCenterFreq;
        //<<<s1Val>>>;
        1::second => now;
    }
    
    
    
    


