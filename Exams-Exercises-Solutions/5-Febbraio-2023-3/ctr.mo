block Controller

InputReal x;
InputReal r;
OutputReal u;

Real x1;

algorithm
when initial() then
    x1 := 0;
elsewhen sample(0,Prm.T) then

u := Prm.k1 * (pre(x)-pre(r)) + Prm.k2/Prm.T * (pre(x1)-pre(x));
x1 := pre(x);

end when;

end Controller;