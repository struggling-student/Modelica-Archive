
block MonitorReq2

// True se Req2 è violato, false altrimenti.

parameter Real Tmonitor = K.T/10;

InputBoolean readsignal1;
InputBoolean readsignal2;
InputBoolean writesignal1;
InputBoolean writesignal2;

InputInteger outputdata1[3];
InputInteger outputdata2[3];
InputInteger inputdata1[1];
InputInteger inputdata2[1];

InputBoolean DB[K.N, K.Q, K.W];

OutputBoolean y;   
OutputBoolean y1;   
OutputBoolean y2;   

M1Req2 m1req2, m2req2;

equation

// M1Req2
connect(writesignal1, m1req2.writesignal1);
connect(readsignal1, m1req2.readsignal1);
connect(outputdata1, m1req2.outputdata1);
connect(inputdata1, m1req2.inputdata1);
connect(DB, m1req2.DB);
connect(y1, m1req2.y1);

// M2Req2
connect(writesignal2, m2req2.writesignal1);
connect(readsignal2, m2req2.readsignal1);
connect(outputdata2, m2req2.outputdata1);
connect(inputdata2, m2req2.inputdata1);
connect(DB, m2req2.DB);
connect(y2, m2req2.y1);

y = y1 or y2;

end MonitorReq2;

