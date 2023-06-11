
block Probe

Prm p;

// inputs are all outputs of your blocks

// from sensors
InputReal sensor[p.N];

// from env
InputReal env_inputdata1[2];      // pair (timestamp, sensor-value)
InputBoolean env_writesignal1;
InputBoolean env_readsignal1;

// from c2s
InputInteger c2s_outputdata[1];
InputBoolean c2s_datavailable;
InputBoolean c2s_spaceavailable;

// from s2c
InputReal s2c_outputdata[2];
InputBoolean s2c_datavailable;  
InputBoolean s2c_spaceavailable;

// from client
InputBoolean client_readsignal;
InputInteger client_inputdata[1];   // sensor id
InputBoolean client_writesignal;
InputReal client_MobAvg[p.N];      // pair (timestamp, sensor-value)

// Anomaly Detection
InputBoolean Yad[p.N];



OutputBoolean probe_output;



equation

probe_output = false;



end Probe;

