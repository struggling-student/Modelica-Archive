model System

User user1;

Plant plant1;

Controller ctr1;

Monitor m1;

equation


connect(user1.Vref, ctr1.Vref);
connect(ctr1.u, plant1.u);
connect(ctr1.v, plant1.v);
connect(plant1.v, m1.v);
connect(plant1.u, m1.u);
connect(user1.Vref, m1.Vref);


end System;
