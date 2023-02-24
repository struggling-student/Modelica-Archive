model System


Prm p;

User user1;

Plant plant1;

Controller ctr1;

Monitor m1;

Probe prb;

equation


// connect models to form system

connect(user1.Zref, ctr1.Zref);

connect(plant1.x, ctr1.x);
connect(plant1.u, ctr1.u);

connect(ctr1.u, m1.u);
connect(plant1.x, m1.x);
connect(user1.Zref, m1.Zref);


// connect outputs of all models to probe


connect(user1.Zref, prb.Zref);
connect(plant1.x, prb.x);
connect(ctr1.u, prb.u);
connect(m1.Ym1, prb.Ym1);



end System;
