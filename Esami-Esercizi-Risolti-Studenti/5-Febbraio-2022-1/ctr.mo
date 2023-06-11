
block Controller

Prm p;  // parameters

InputReal x[2];   // plant state: x[1] = x_cpu, x[2] = x_mem
InputReal Zref[2];  //  setpoint scelto dallo user: Zref[1] = cpu, Zref[2] = mem
OutputReal u[2];  //  plant input: u[1] = u_ka, u[2] = u_mc



equation

u[1] = ((Zref[1]-x[1] - p.A[1,1] * x[1] - p.A[1,1] * x[2] - (p.B[1,2] / p.B[2,2])* Zref[2] + (p.B[1,2] / p.B[2,2])* x[2] + (p.B[1,2] / p.B[2,2])* p.A[2,1] * x[1] +(p.B[1,2] / p.B[2,2])* p.A[2,1] * x[2]
) 
/ p.B[1,1]) / (1 -((p.B[1,2] / p.B[2,2]) * p.B[2,1]) / p.B[1,1] );

u[2] = (Zref[2]-x[2] - p.A[2,1] * x[1] - p.A[2,1] * x[2] - p.B[2,1] * u[1]) / p.B[2,2];




end Controller;

