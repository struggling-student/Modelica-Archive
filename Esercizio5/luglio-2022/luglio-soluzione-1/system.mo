model System


User user1;

Plant plant1;

Controller ctr1;

Monitor m1;


equation


// connect models to form system

connect(user1.Zref, ctr1.Zref);
connect(ctr1.u, plant1.u);
connect(ctr1.x, plant1.x);
connect(plant1.x, m1.x);
connect(plant1.u, m1.u);
connect(user1.Zref, m1.Zref);




end System;
