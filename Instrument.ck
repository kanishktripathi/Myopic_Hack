//Class definition of an abstract track in our Full Mix
public class Instrument
{
    //class preconstructor
    SndBuf buf;
    
    function void setSoundFile (string filename)
    {
        filename => buf.read;
    }
    
    function void setPos(int pos)
    {
       pos => buf.pos;
    }
    
    function void setGain(float gain)
    {
        gain => buf.gain;
    }
    
    function void connect(UGen ugen)
    {
        buf => ugen;
    }
}