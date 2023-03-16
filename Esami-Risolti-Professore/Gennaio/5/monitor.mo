
block Monitor

Prm p;  // parameters

InputReal x[2];   // plant state: x[1] = x_cpu, x[2] = x_mem
InputReal Zref[2];  //  setpoint scelto dallo user: Zref[1] = cpu, Zref[2] = mem
InputReal u[2];  //  plant input: u[1] = u_ka, u[2] = u_mc


OutputReal Ym1[2];    // Ym1[i]: errore su x[i]

equation


Ym1 = (x - Zref);


end Monitor;

