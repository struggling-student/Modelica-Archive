
block Env

Prm p;   // parameters

// client input queue (ciq) where server sends data to client
OutputReal inputdata1[1];      // sensor value
OutputBoolean writesignal1;
InputBoolean spaceavailable1;


// server input queue (siq) where server receives commands from client
OutputBoolean readsignal1;
InputInteger outputdata1[2];   // pair (c, d)
InputBoolean datavailable1;  



end Env;

