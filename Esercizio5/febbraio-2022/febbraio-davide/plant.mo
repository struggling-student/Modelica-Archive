
block Plant

Prm p;  // parameters
OutputReal x[2];   // plant state: x[1] = x_cpu, x[2] = x_mem
InputReal u[2];    //  plant input: u[1] = u_ka, u[2] = u_mc

initial equation
x[1] = 0.58; // initial value of x_cpu
x[2] = 0.55;// initial value of x_mem


equation

der(x[1]) = x[1] * p.A[1,1] + x[2] * p.A[1,1] + u[1] * p.B[1,1] + u[2] * p.B[1,2]; 
der(x[2]) = x[1] * p.A[2,1] + x[2] * p.A[2,1] + u[1] * p.B[2,1] + u[2] * p.B[2,2];






end Plant;

