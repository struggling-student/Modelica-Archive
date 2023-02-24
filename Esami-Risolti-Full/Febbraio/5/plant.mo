
block Plant


InputReal u;   //  Throttle dal controoler
OutputReal v;  // velocità auto

parameter Real A = 1;
parameter Real C = 0.01;
parameter Real D = 0.01;


initial equation
v = 0;


equation

der(v) = K.A*u - K.C*(v^2) - K.D;


end Plant;

