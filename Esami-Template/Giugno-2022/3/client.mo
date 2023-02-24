
block ClientMockup


Prm p;

// client input queue (ciq) con la quali il client riceve dati dal server
OutputBoolean readsignal;
InputReal outputdata[1];  // sensor value
InputBoolean datavailable;  

// server input queue (siq) con la quale il client manda comandi al server
OutputInteger inputdata[2];   // pair (c, d)
OutputBoolean writesignal;
InputBoolean spaceavailable;



end ClientMockup;

