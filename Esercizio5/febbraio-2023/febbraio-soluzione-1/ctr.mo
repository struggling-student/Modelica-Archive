
block Controller


InputReal x;   // plant state: 
InputReal r;	//setpoint 
OutputReal u;  //  plant input: u
Real x1;

algorithm

when sample(0, Prm.T) then
	x1 := pre(x);
	u := Prm.k1 * (x-r) +(Prm.k2/Prm.T) *(x1-x);
	
end when;


equation


end Controller;

