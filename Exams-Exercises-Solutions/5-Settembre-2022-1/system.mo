model System

User us;
Plant p;
Controller ctr;
Monitor m;


YDev[3] yd;
Terminator ter;

equation
  

        connect(p.v, ctr.v);
        connect(p.x, ctr.x);
         connect(ctr.u, p.u);
         connect(us.r, ctr.r);
        connect(ctr.x, m.x);
        connect(ctr.r, m.r);
        connect(yd[1].termcond,ter.termcond[1]);
        connect(yd[2].termcond,ter.termcond[2]);
        connect(yd[3].termcond,ter.termcond[3]);
        connect(yd[1].y,ter.y[1]);
        connect(yd[2].y,ter.y[2]);
        connect(yd[3].y,ter.y[3]);
        connect(yd[1].stdDev,ter.z[1]);
        connect(yd[2].stdDev,ter.z[2]);
        connect(yd[3].stdDev,ter.z[3]);

        connect(m.clk,yd[3].clk);
         connect(m.clk,yd[2].clk);
        connect(m.clk,yd[1].clk);
        connect(m.e[1],yd[1].prm);
        connect(m.e[2],yd[2].prm);
        connect(m.e[3],yd[3].prm);

end System;
