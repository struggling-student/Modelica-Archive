
block ClientMockup


Prm p;

// s2c
// client input queue (ciq) con la quali il client riceve dati dal server
OutputBoolean readsignal;
InputReal outputdata[2];  // pair (time stamp, sensor value)
InputBoolean datavailable;  

//  c2s
// server input queue (siq) con la quale il client manda dati al server
OutputInteger inputdata[1];   // sensor id
OutputBoolean writesignal;
InputBoolean spaceavailable;

OutputReal y[2, p.N];   //   (timestamp, value) from sensor i

Integer state, sensor_index, fifox;

algorithm

when initial() then

state := 0;
readsignal := false;
writesignal := false;
sensor_index := 0;
fifox := InitFifoIOState();
inputdata[1] := 0;

for i in 1:p.N loop
   y[1, i] := 0;
   y[2, i] := 0;
end for;


elsewhen sample(0, p.Tclient)  then


if (state == 0) 
then   //  select sensor at random
    sensor_index := 1 + integer(myrandom()*0.999*p.N);
    inputdata[1] := sensor_index;
    state := 10;

elseif (state == 10) 
then   // send req to server

    (writesignal, fifox) :=
    WriteToFIFO(pre(fifox), pre(writesignal), pre(spaceavailable));
     
     if (FifoIODone(fifox))
     then  // writing is over, value sent
           state := 20;  
	   fifox := InitFifoIOState();
     end if;


elseif (state == 20) 
then  // read from server


(readsignal, fifox) :=
    ReadFromFIFO(pre(fifox), pre(datavailable), pre(readsignal));


     if (FifoIODone(fifox))
     then  // reading done, value ready
           y[1, sensor_index] := pre(outputdata[1]);  // timestamp 
           y[2, sensor_index] := pre(outputdata[2]);  // value
           state := 0;  // loop
	   fifox := InitFifoIOState();
     end if;

      
else
    state := pre(state);   // loop

end if;



end when;



end ClientMockup;

