
block Controller


InputReal x;   // plant state: 
InputReal r;  //  setpoint scelto dallo user: 
OutputReal u;  //  plant input: u
OutputReal x1;

algorithm

when initial() then
x1 := 0;

elsewhen sample(0, Prm.T) then
	u := Prm.k1*(pre(x)-r) + (Prm.k2/Prm.T)*(pre(x1)-pre(x));
	x1 := pre(x);
end when;


equation


end Controller;

