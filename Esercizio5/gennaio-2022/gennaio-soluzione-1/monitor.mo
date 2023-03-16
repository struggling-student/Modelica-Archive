
block Monitor

InputReal v;     // velocità auto
InputReal u;     // Throttle
InputReal Vref;  // setpoint dallo user

OutputReal y;    // errore, differenza tra v e Vref.

equation


y = (v - Vref);


end Monitor;

