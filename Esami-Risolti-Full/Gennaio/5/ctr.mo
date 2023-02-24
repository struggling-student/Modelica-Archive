
block Controller

Prm p;  // parameters

InputReal x[2];   // plant state: x[1] = x_cpu, x[2] = x_mem
InputReal Zref[2];  //  setpoint scelto dallo user: Zref[1] = cpu, Zref[2] = mem
OutputReal u[2];  //  plant input: u[1] = u_ka, u[2] = u_mc


equation

p.A*x + p.B*u = (Zref - x);

end Controller;

