model System

Prm p;

DTMC mt1[p.W];

CompletionTime ctl1[p.W];

Monitor m1;

equation


// connect models to form system

for k in 1:p.W loop

mt1[k].team = k;

connect(mt1[k].x, ctl1[k].x);
connect(ctl1[k].y, m1.y[k]);
connect(ctl1[k].z, m1.z[k]);

end for;



end System;
