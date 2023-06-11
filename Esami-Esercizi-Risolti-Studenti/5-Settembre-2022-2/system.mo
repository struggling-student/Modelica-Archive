model System

Prm p;

User user1;

Plant plant1;

Controller ctr1;

Monitor m1;

//StandardCalculator st[3];


equation


// connect models to form system

connect(user1.r, ctr1.r);
connect(ctr1.u, plant1.u);
connect(ctr1.x, plant1.x);
connect(ctr1.v, plant1.v);


connect(plant1.x, m1.X);
connect(plant1.v, m1.V);
connect(ctr1.u, m1.U);
connect(user1.r, m1.R);

/*
for i in 1:3 loop

connect(st[i].x, m1.W[i]);
connect(st[i].z, m1.z[i]);
connect(st[i].y, m1.y[i]);

end for;

*/




end System;
