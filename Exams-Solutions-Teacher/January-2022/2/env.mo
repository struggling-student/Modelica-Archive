
block Env

Prm p;   // parameters

InputReal sensor[p.N];

// client input queue (ciq) where server (env) sends data to client
OutputReal inputdata1[2];      // pair (timestamp, sensor-value)
OutputBoolean writesignal1;
InputBoolean spaceavailable1;


// server input queue (siq) where server (env) receives data from client
OutputBoolean readsignal1;
InputInteger outputdata1[1];   // id sensore
InputBoolean datavailable1;  

Integer state, ValueFromClient, fifox;


algorithm

when initial() then

state := 0;
readsignal1 := false;
writesignal1 := false;
fifox := InitFifoIOState();
inputdata1[1] := 0;
inputdata1[2] := 0;
ValueFromClient := 0;

elsewhen sample(0, p.Tenv)  then

if (state == 0) 
then // read data from client

    (readsignal1, fifox) :=
    ReadFromFIFO(pre(fifox), pre(datavailable1), pre(readsignal1));

     if (FifoIODone(fifox))
     then  // reading done, value ready
           ValueFromClient := pre(outputdata1[1]);
           state := 10;
	   fifox := InitFifoIOState();
     end if;     


elseif  (state == 10)
then // prep value

     inputdata1[1] := time;
     inputdata1[2] := sensor[ValueFromClient];

      state := 20;  

elseif  (state == 20)
then // send value to client

    (writesignal1, fifox) :=
    WriteToFIFO(pre(fifox), pre(writesignal1), pre(spaceavailable1));
     
     if (FifoIODone(fifox))
     then  // writing is over, value sent
           state := 0;  // loop
	   fifox := InitFifoIOState();
     end if;



else
    state := pre(state);   // loop

end if;


end when;


end Env;

