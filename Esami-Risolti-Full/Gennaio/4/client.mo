
block Client


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

OutputReal MobAvg[p.N];   //   Mobile average from sensor i

Real y[2, p.N];   //   (timestamp, value) from sensor i

Real x[p.N, p.W];   // last W values from sensors

Integer  sk[p.N];   // index of last sensor reading in 0, p.W - 1

Integer state, sensor_index, fifox;
Real counter;

algorithm

when initial() then

counter := 0.0;
state := 0;
readsignal := false;
writesignal := false;
sensor_index := 0;
fifox := InitFifoIOState();
inputdata[1] := 0;

for i in 1:p.N loop
   y[1, i] := 0;
   y[2, i] := 0;
   sk[i] := 0;
   MobAvg[i] := 0;
   for j in 1:p.W  loop x[i, j] := 0; end for;
end for;


elsewhen sample(0, p.Tclient)  then


if (state == 0) and (counter > 0)
then   // wait
    counter := pre(counter) - p.Tclient;
    
elseif (state == 0) and (counter <= 0)
then   // start sensor reading
     state := 10;
     sensor_index := 1;

elseif (state == 10) and (sensor_index <= p.N)
then   // select sensor
    inputdata[1] := sensor_index;
    state := 20;

elseif (state == 20) 
then   // send req

    (writesignal, fifox) :=
    WriteToFIFO(pre(fifox), pre(writesignal), pre(spaceavailable));
     
     if (FifoIODone(fifox))
     then  // writing is over, value sent
           state := 30;  
	   fifox := InitFifoIOState();
     end if;


elseif (state == 30) 
then  // read from server


(readsignal, fifox) :=
    ReadFromFIFO(pre(fifox), pre(datavailable), pre(readsignal));


     if (FifoIODone(fifox))
     then  // reading done, value ready for processing
           y[1, sensor_index] := pre(outputdata[1]);  // timestamp 
           y[2, sensor_index] := pre(outputdata[2]);  // value
	   
	   x[sensor_index, sk[sensor_index] + 1] := y[2, sensor_index];  // store value
           
           // update index
	   sk[sensor_index] := mod(sk[sensor_index] + 1, p.W);

           MobAvg[sensor_index] := Average(p, x, sensor_index);
   
           state := 40;
	   fifox := InitFifoIOState();
     end if;



elseif (state == 40) 
then  // next sensor

      if (sensor_index < p.N)
      then 
           sensor_index := pre(sensor_index) + 1;
	   state := 10; // check  next sensor 
       else
          sensor_index := 1;
	  counter := 60.0;
          state := 0;  // loop
      end if;
      
else
    state := pre(state);   // loop

end if;



end when;



end Client;

