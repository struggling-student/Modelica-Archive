
block MonitorReq3

// True se Req3 è violato, false altrimenti.


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

M1Req3 m1req3, m2req3;

equation

// M1Req3
connect(writesignal1, m1req3.writesignal1);
connect(readsignal1, m1req3.readsignal1);
connect(outputdata1, m1req3.outputdata1);
connect(inputdata1, m1req3.inputdata1);
connect(DB, m1req3.DB);
connect(y1, m1req3.y1);

// M2Req3
connect(writesignal2, m2req3.writesignal1);
connect(readsignal2, m2req3.readsignal1);
connect(outputdata2, m2req3.outputdata1);
connect(inputdata2, m2req3.inputdata1);
connect(DB, m2req3.DB);
connect(y2, m2req3.y1);

y = y1 or y2;

end MonitorReq3;

