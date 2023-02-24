
block Controller


InputReal v;   // velocità auto 
InputReal Vref;  //  setpoint scelto dallo user 
OutputReal u;  //  Throttle

parameter Real T = 0.001;

Real z;


algorithm

when initial() then

z := 0;
u := 0;

elsewhen sample(0, T) then

z := pre(z) + T*(pre(Vref) - pre(v));

u := K.Kp*(pre(Vref) - pre(v)) + K.Ki*pre(z);

end when;


end Controller;

