model System

User user1;

Disturbance dis1;

Plant plant1;

Controller ctr1;

Monitor m1;


equation


// connect models to form system connect(variabili dei due blocchi)

connect(user1.r, ctr1.r);
connect(ctr1.u, plant1.u);
connect(ctr1.x, plant1.x);
connect(dis1.d,plant1.d);


//connect del monitor
connect(plant1.x, m1.x);
connect(plant1.u, m1.u);
connect(user1.r, m1.r);

end System;
