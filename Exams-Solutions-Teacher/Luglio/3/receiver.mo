
block Receiver

// fifos2c

// read side
OutputBoolean readsignal;
InputReal outputdata[1];
InputBoolean datavailable;  

OutputReal ValueFromServer;

Integer state;

algorithm

when initial() then

state := 10;  // prepare to read
ValueFromServer := 0;
readsignal := false;


// Takes two samples reading from fifo, thus at most T/4, less is also OK.
// The smaller this sampling time, the smaller the communication delay

elsewhen sample(0, Prm.T/4) then

// read data from fifo, if any 

if  (state == 10) and pre(datavailable)
then  // ask data to fifo
      readsignal := not(pre(readsignal));
      state := 20;
      
elseif  (state == 20)   then
      // read data from fifo
     ValueFromServer := pre(outputdata[1]);
     state := 10;  // loop
else
     state := pre(state);
end if;

end when;



end Receiver;

