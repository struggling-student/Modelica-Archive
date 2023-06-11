
block Plant


InputReal u;   //  Throttle dal controoler
OutputReal x;
OutputReal r;
OutputReal z;

algorithm
    when sample(0, 1) then
        x := pre(x) + (2 * myrandom() - 1);
        r := pre(r) * pre(u);
        z := exp(pre(x)) - pre(r);
    end when;

initial equation
    x = 0;
    r = 1;

end Plant; 