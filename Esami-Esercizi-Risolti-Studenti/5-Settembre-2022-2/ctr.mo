
block Controller


InputReal x[3];   // plant state: 
InputReal v[3];  //  setpoint scelto dallo user: 

InputReal r[3]; // from user

OutputReal u[3];  //  plant input: u

algorithm


when sample(0, K.T) then



u[1] := K.k1 * (x[1] - r[1]) + K.k2 * v[1];
u[2] := K.k1 * (x[2] - r[2]) + K.k2 * v[2];
u[3] := Prm.g + K.k1 * (x[3] - r[3]) + K.k2 * v[3];



end when;


end Controller;

