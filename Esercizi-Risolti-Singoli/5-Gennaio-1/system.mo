model System

User us;
Plant p;
Controller ctr;
Monitor m;

Wind w;

YDev[3] yd;
Terminator ter;

equation
    connect(w.w, p.w);

    connect(p.u, ctr.u);
    connect(ctr.x, p.x);
    connect(ctr.v, p.v);
    connect(us.r, ctr.r);
    
    connect(m.x, p.x);
    connect(m.r, us.r);

    connect(yd[1].prm, m.e[1]);
    connect(yd[2].prm, m.e[2]);
    connect(yd[3].prm, m.e[3]);
    connect(yd[1].clk, m.clk);
    connect(yd[2].clk, m.clk);
    connect(yd[3].clk, m.clk);

    connect(ter.termcond[1], yd[1].termcond);
    connect(ter.termcond[2], yd[2].termcond);
    connect(ter.termcond[3], yd[3].termcond);
    connect(ter.y[1], yd[1].y);
    connect(ter.y[2], yd[2].y);
    connect(ter.y[3], yd[3].y);
    connect(ter.z[1], yd[1].stdDev);
    connect(ter.z[2], yd[2].stdDev);
    connect(ter.z[3], yd[3].stdDev);

end System;
