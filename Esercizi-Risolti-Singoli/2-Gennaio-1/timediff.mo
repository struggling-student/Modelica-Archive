block TimeDiff

InputBoolean delivery;
OutputReal diff;

OutputBoolean clock;

Real tld;

Prm p;

algorithm
    when initial() then
        tld := 0;
        clock := false;
    elsewhen not(delivery == pre(delivery)) then
        diff := time - tld;
        tld := time;
        clock := not(pre(clock));
    end when;

end TimeDiff;

