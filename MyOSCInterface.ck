
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
    
   
    
   SndBuf fullmix  => dac;
   SndBuf sound1 => Pan2 p1 => JCRev rev1 => dac;
   SndBuf sound2 => Pan2 p2 => JCRev rev2 => dac;
   SndBuf sound3 => Pan2 p3 => JCRev rev3 => dac;
   SndBuf sound4 => Pan2 p4 => JCRev rev4 => dac;
   SndBuf sound5 => Pan2 p5 => JCRev rev5 => dac;
   SndBuf sound6 => Pan2 p6 => JCRev rev6 => dac;
   SndBuf sound7 => dac;
   SndBuf sound8 => dac;
   SndBuf sound9 => dac;
   SndBuf sound10 => dac;
   
    me.sourceDir() + "/Samples/FullMix.wav" => string filename;
    me.sourceDir() + "/Samples/bluejay.wav" => string file1;
    me.sourceDir() + "/Samples/cockatiel.wav" => string file2;
    me.sourceDir() + "/Samples/pigeonfly.wav" => string file3;
    me.sourceDir() + "/Samples/bsing1.wav" => string file4;
    me.sourceDir() + "/Samples/bsing2.wav" => string file5;
    me.sourceDir() + "/Samples/wind.wav" => string file6;
    
    filename => fullmix.read; 
    file1 => sound1.read;
    file2 => sound2.read;
    file3 => sound3.read;
    file4 => sound4.read;
    file5 => sound5.read;
    file6 => sound6.read;
    
    0 => fullmix.pos => sound1.pos => sound2.pos => sound3.pos => sound4.pos => sound5.pos => sound6.pos => sound7.pos => sound8.pos => sound9.pos => sound10.pos ;
    0.5 => fullmix.gain;
    0.1 => sound1.gain => sound2.gain => sound3.gain => sound4.gain => sound5.gain => sound6.gain => sound7.gain => sound8.gain => sound9.gain => sound10.gain;
    0.1 => rev1.mix => rev2.mix => rev3.mix =>  rev4.mix => rev5.mix =>  rev6.mix; 
    spork~getS1Val(s1Thread);
    spork~getS2Val(s2Thread);
    spork~getS3Val(s3Thread);
    spork~getS4Val(s4Thread);
    spork~getS5Val(s5Thread);
    spork~getS6Val(s6Thread);
    spork~getS7Val(s7Thread);
    spork~getS8Val(s8Thread);
    spork~getS9Val(s9Thread);
    

    // time loop
    while( true )
    {
        if(s4Val >0)
        {
            0 => sound1.pos;
            Math.random2f(-1,1) => p1.pan;
            Math.random2f(0.75,1.25) => sound1.rate;
            Math.random2f(0,0.1) => sound1.gain;
            Math.random2f(0,0.1) => rev1.mix;
            5::second => now;
        }
        if(s5Val >0)
        {
            0 => sound2.pos;
            Math.random2f(-1,1) => p2.pan;
            Math.random2f(0.75,1.25) => sound2.rate;
            Math.random2f(0.05,0.1) => sound2.gain;
            Math.random2f(0,0.1) => rev2.mix;
            3::second => now;
        }
        if(s6Val > 0)
        {
            0 => sound3.pos;
            Math.random2f(-1,1) => p3.pan;
            Math.random2f(0.75,1.25) => sound3.rate;
            Math.random2f(0.05,0.1) => sound3.gain;
            Math.random2f(0,0.1) => rev3.mix;
            3::second => now;
        }
        if(s7Val > 0)
        {
            0 => sound4.pos;
            Math.random2f(-1,1) => p4.pan;
            Math.random2f(0.75,1.25) => sound4.rate;
            Math.random2f(0.05,0.1) => sound4.gain;
            Math.random2f(0,0.1) => rev4.mix;
            3::second => now;
        }
        if(s8Val > 0)
        {
            0 => sound5.pos;
            Math.random2f(-1,1) => p5.pan;
            Math.random2f(0.75,1.25) => sound5.rate;
            Math.random2f(0.05,0.1) => sound5.gain;
            Math.random2f(0,0.1) => rev5.mix;
            3::second => now;
        }
        if(s9Val > 0)
        {
            0 => sound6.pos;
            Math.random2f(-1,1) => p6.pan;
            Math.random2f(0.75,1.25) => sound6.rate;
            Math.random2f(0.05,0.1) => sound6.gain;
            Math.random2f(0,0.1) => rev6.mix;
            3::second => now;

        }
        500::ms => now;
    }
    
    

