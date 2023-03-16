
block Plant


InputReal u[3];   //  Throttle dal controoler
OutputReal x[3];
OutputReal v[3];


equation
    der(x[1]) = v[1];
    der(x[2]) = v[2];
    der(x[3]) = v[3];
    der(v[1]) = u[1];
    der(v[2]) = u[2];
    der(v[3]) = u[3] - K.g;

initial equation
    x[1] = 0;
    x[2] = 0;
    x[3] = 0;
    v[1] = 0;
    v[2] = 0;
    v[3] = 0;

end Plant;