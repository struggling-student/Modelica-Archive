
block Plant

Prm p;  // parameters

OutputReal x[2];   // plant state: x[1] = x_cpu, x[2] = x_mem
InputReal u[2];    //  plant input: u[1] = u_ka, u[2] = u_mc

equation


der(x) = p.A*x + p.B*u;

end Plant;

