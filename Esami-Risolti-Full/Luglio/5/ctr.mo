
block Controller


InputReal x[3];   // plant state: 
InputReal Zref;  //  setpoint scelto dallo user: 
OutputReal u;  //  plant input: u

Real z[1];
Real v[2];

algorithm

when initial() then

z[1] := 0;
v[1] := 0; 
v[2] := 0;

elsewhen sample(0, Prm.T) then

z[1] := pre(x[3]);
v[2] := pre(v[1]);
u := if (abs(pre(v[1]) - pre(v[2])) < 1E-6)
     then 0.9*pre(v[1])
     else v[1] - 0.1*(pre(z[1]) - pre(x[3]))/(pre(v[1]) - pre(v[2])) ;
     
v[1] := u;

end when;


equation


end Controller;

