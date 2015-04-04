// sound file
me.sourceDir() + "/Samples/FullMix.wav" => string filename;
InstrumentTrack fullmix;
fullmix.setSoundFile(filename);
fullmix.connect(dac);


// the patch 
//SndBuf buf => dac;
// load the file
//filename => buf.read;


// time loop
while( true )
{
    fullmix.setPos(0);
    //Math.random2f(.2,.5) => buf.gain;
    fullmix.setGain(0.5);
    //Math.random2f(.5,1.5) => buf.rate;
    3::minute => now;
}