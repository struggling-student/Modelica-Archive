model System


Prm p;

User user1;

Plant plant1;

Controller ctr1;

Monitor m1;

Probe prb;

equation

    connect(user1.Zref,m1.Zref);
    connect(user1.Zref,ctr1.Zref);
    connect(ctr1.u,plant1.u);
    connect(ctr1.u,m1.u);
    connect(plant1.x,ctr1.x);
    connect(plant1.x,m1.x);
    connect(user1.Zref,prb.Zref);
    connect(ctr1.u,prb.u);
    connect(plant1.x,prb.x);
    connect(m1.Ym1,prb.Ym1);

    


// connect outputs of all models to probe





end System;
