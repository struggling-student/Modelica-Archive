model System

User user1;

Plant plant1;

Controller ctr;

Monitor m1;

Disturbance d1;

Terminator term;

equation

connect(plant1.x,ctr.x);
connect(user1.r,ctr.r);
connect(ctr.u,plant1.u); 
 connect(d1.w,plant1.d); 

connect(plant1.x,m1.x);
connect(user1.r,m1.r);

connect(term.e, m1.e);


end System;
