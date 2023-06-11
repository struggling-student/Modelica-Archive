model System

Prm q;

DTMC mc;

Monitor m1;

//Probe prb;

equation


// connect models to form system


for k in 1:q.W loop
   connect(mc.x[k], m1.x[k]);
end for;

// connect output of all models to probe

// for k in 1:p.W loop
//    connect(mc.x[k], prb.x[k]);
//    connect(m1.y[k], prb.y[k]);
//    connect(m1.z[k], prb.z[k]);
// end for;




end System;
