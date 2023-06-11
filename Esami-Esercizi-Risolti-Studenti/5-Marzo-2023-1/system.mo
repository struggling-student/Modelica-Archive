model System

//User us;
Plant p;
Controller ctr;
Monitor m;


YDev[2] yd;
Terminator ter;

equation

    connect(ctr.u, p.u);
    connect(ctr.z, p.z);
    
    connect(m.z, p.z);
    connect(m.r, p.r);

    connect(yd[1].prm, m.e[1]);
    connect(yd[2].prm, m.e[2]);
    connect(yd[1].clk, m.clk);
    connect(yd[2].clk, m.clk);


    connect(ter.y[1], yd[1].y);
    connect(ter.y[2], yd[2].y);
    connect(ter.z[1], yd[1].stdDev);
    connect(ter.z[2], yd[2].stdDev);

end System;
