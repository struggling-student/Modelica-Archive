model System


User user1;

Plant plant1;

Controller ctr1;

Monitor m1;

Disturbance d1;

equation


// connect models to form system
//ctr
connect(ctr1.r, user1.r);
connect(ctr1.x, plant1.x);

//plant
connect(plant1.d, d1.d);
connect(plant1.u, ctr1.u);

//monitor
connect(m1.x, plant1.x);
connect(m1.r, user1.r);



end System;
