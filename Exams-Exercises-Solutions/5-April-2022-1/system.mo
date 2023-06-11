model System

User us;
Plant p;
Controller ctr;
Monitor m;



equation
  

        connect(p.C, ctr.C);
        connect(p.C, m.C);
        connect(us.v_ref, ctr.v_ref);
        connect(us.v_ref, m.v_ref);
        connect(ctr.u, p.u);
        

end System;
