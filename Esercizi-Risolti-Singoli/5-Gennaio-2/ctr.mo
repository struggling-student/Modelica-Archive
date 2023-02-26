
block Controller


InputReal x[3];  
InputReal v[3];  

InputReal r[3];

OutputReal u[3]; 

algorithm

//for i in 1:3 loop
//	u[i] := 0;
//end for; 

when sample(0, Prm.T) then

u[1] := Prm.k1 * (x[1] - r[1]) + Prm.k2 * v[1];
u[2] := Prm.k1 * (x[2] - r[2]) + Prm.k2 * v[2];
u[3] := Prm.g + Prm.k1 * (x[3] - r[3]) + Prm.k2 * v[3];


end when;


end Controller;

