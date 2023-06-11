
block Monitor

Prm p;  // parameters

InputReal x[3];   // plant state: 
InputReal Zref;  //  setpoint scelto dallo user
InputReal u;  //  plant input: u


OutputReal Y;    // Y: errore su C

equation

Y = (x[3] -Zref);


end Monitor;

