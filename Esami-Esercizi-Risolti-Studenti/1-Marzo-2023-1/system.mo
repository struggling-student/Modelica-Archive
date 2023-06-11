model System



DTMC mc1[Prm.W];

CompletionTime ct1[Prm.W];

Monitor m1;

equation

// connect models to form system

for k in 1:Prm.W loop

mc1[k].team = k;

connect(mc1[k].x, ct1[k].x);
connect(ct1[k].y, m1.y[k]);
connect(ct1[k].z, m1.z[k]);

end for;


end System;
