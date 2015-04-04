//Class Definition of instruments with a variable filter
public class FilteredInstrument extends Instrument
{
    BPF bpf;
    2.0 => bpf.Q;
    
    public void setCenterFreq(float freq)
    {
        freq => bpf.freq;
    }
    
    public void connect(UGen ugen)
    {
        buf => bpf => ugen;
    }
}
