
block Plant

OutputReal x[3];
OutputReal v[3];
InputReal u[3];

// variabili del vento
InputReal w1, w2;

initial equation
// valori iniziali
x[1] = 0;
x[2] = 0;
x[3] = 0;
v[1] = 0;
v[2] = 0;
v[3] = 0;

equation

// derivate
der(x[1]) = v[1];
der(x[2]) = v[2]; 
der(x[3]) = v[3];
der(v[1]) = u[1] + w1;
der(v[2]) = u[2] + w2;
der(v[3]) = u[3] - Prm.g;

end Plant;

