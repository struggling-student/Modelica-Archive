
block Client

// input queue

// write side  fifo
InputBoolean writesignal;  
InputReal inputdata[1]; 
OutputBoolean spaceavailable;  

OutputReal ValueFromServer;  // ValueFromServer stream 

// OutputReal y;  // anomaly signal

MobAvg Mavg;

Receiver rec;

FifoS2C  fifos2c;


equation

connect(fifos2c.writesignal, writesignal);
connect(fifos2c.inputdata, inputdata);
connect(fifos2c.spaceavailable, spaceavailable);

connect(rec.readsignal, fifos2c.readsignal);
connect(rec.outputdata, fifos2c.outputdata);
connect(rec.datavailable, fifos2c.datavailable);
connect(rec.ValueFromServer, ValueFromServer);

connect(rec.ValueFromServer, Mavg.u);


/*
y = if (ValueFromServer < 0.8*Mavg.y)
    then -1 else (if (ValueFromServer > 1.2*Mavg.y) then +1 else 0);
*/

end Client;

