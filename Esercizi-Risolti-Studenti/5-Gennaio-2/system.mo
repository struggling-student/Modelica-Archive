model System

Prm p;

User u;

Plant pl;

Controller c;

Monitor m;

Wind w;
equation

connect(u.r, c.r);
connect(c.u, pl.u);
connect(c.x, pl.x);
connect(c.v, pl.v);
connect(w.w1, pl.w1);
connect(w.w2, pl.w2);

connect(pl.x, m.X);
connect(pl.v, m.V);
connect(c.u, m.U);
connect(u.r, m.R);


end System;
