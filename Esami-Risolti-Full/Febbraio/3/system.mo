model System

Env env1;

Monitor1 m1;

Client c1(ClientName = 1), c2(ClientName = 2);

Server s1;

Channel c1tos1(M=3), c2tos1(M=3);

Channel s1toc1(M=1), s1toc2(M=1);


equation

connect(env1.u, c1.u);
connect(env1.u, c2.u);

// c1 to s1
connect(c1.writesignal, c1tos1.writesignal);
connect(c1.inputdata, c1tos1.inputdata);
connect(c1.spaceavailable, c1tos1.spaceavailable);
connect(c1tos1.readsignal, s1.readsignal1);
connect(c1tos1.outputdata, s1.outputdata1);
connect(c1tos1.datavailable, s1.datavailable1);

// c2 to s1
connect(c2.writesignal, c2tos1.writesignal);
connect(c2.inputdata, c2tos1.inputdata);
connect(c2.spaceavailable, c2tos1.spaceavailable);
connect(c2tos1.readsignal, s1.readsignal2);
connect(c2tos1.outputdata, s1.outputdata2);
connect(c2tos1.datavailable, s1.datavailable2);


// s1 to c1
connect(s1.writesignal1, s1toc1.writesignal);
connect(s1.inputdata1, s1toc1.inputdata);
connect(s1.spaceavailable1, s1toc1.spaceavailable);
connect(s1toc1.readsignal, c1.readsignal);
connect(s1toc1.outputdata, c1.outputdata);
connect(s1toc1.datavailable, c1.datavailable);

// s1 to c2
connect(s1.writesignal2, s1toc2.writesignal);
connect(s1.inputdata2, s1toc2.inputdata);
connect(s1.spaceavailable2, s1toc2.spaceavailable);
connect(s1toc2.readsignal, c2.readsignal);
connect(s1toc2.outputdata, c2.outputdata);
connect(s1toc2.datavailable, c2.datavailable);

// monitor 1
connect(env1.u, m1.u);


end System;
