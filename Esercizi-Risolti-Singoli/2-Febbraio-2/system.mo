model System

Monitor1 m1;
Env env;
FIFO q;
FifoTerminator qterm;

equation

connect(m1.request, env.request);

// Connect lato scrittura fifo env -> q
    connect(q.writesignal, env.writesignal);
    connect(q.writefifodata, env.writefifodata);
    connect(q.spaceavailable, env.spaceavailable);

// Connect lato lettura fifo qterm <- q
    connect(qterm.readsignal, q.readsignal);
    connect(qterm.readfifodata, q.readfifodata);
    connect(qterm.datavailable, q.datavailable);


end System;
