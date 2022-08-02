
method add(constant_var: int, unitdelay_output: int) returns (unitdelay_input: int)
requires true
ensures unitdelay_input > -128 && unitdelay_input < 127
{
    constant_var:= 1;
    sumblock_input:= 1;
    while(unitdelay_input > -128 && unitdelay_input < 127)
    invariant unitdelay_input > -128 && unitdelay_input < 127
    //invariant
    {
        unitdelay_output:= unitDelay(sumblock_input);
        unitdelay_input:= constant_var + unitdelay_output;
    }

}

method unitDelay(sumblock_input: int) returns (unitdelay_output: int)
{
    var i: int;
    i:= 0;
    while(i< 10)
    {
        i:= i+1;
    }
    sumblock_input:= unitdelay_output;
}

datatype e = ENABLE | DISABLE
method subsystemEnabler(input: int) returns (system : e) 
ensures (input >0 && system==e.ENABLE) || (input ==0 && system==e.DISABLE)
{
    if(input > 0)
    {
        system:= e.ENABLE;
    }
    else if(input ==0)
    {
        system:= e.DISABLE;
    }
}

method sinewave()
{
    var sin: real;
    var amp: real;
    var bias: real;
    amp,bias:= 10.0, 4.0;
    assume (sin> 0.0);
}