
function InitFifoIOState
output Integer x;
algorithm
   x := 0;
end InitFifoIOState;


function FifoIODone
input Integer x;
output Boolean done;

algorithm

if (x == 2) then
   done := true;
else
   done := false;
end if;

end FifoIODone;


function ReadFromFIFO
input Integer x;   // state
input Boolean datavailable;
input Boolean readsignal;
output Boolean new_readsignal;
output Integer new_x;


algorithm

new_readsignal := readsignal;

if (x == 0) and datavailable
then // there are data to read

     new_readsignal := not(readsignal);
     new_x := 1;
     
elseif  (x == 1)
then // read msg from fifo
     new_x := 2;  // reading is over
     
else  // hold
      new_x := x;
      
end if;

end ReadFromFIFO;



function WriteToFIFO
input Integer x;   // state
input Boolean writesignal;
input Boolean spaceavailable;
output Boolean new_writesignal;
output Integer new_x;

algorithm

new_writesignal := writesignal;

if (x == 0) 
then // value assigned

      new_x := 1;

elseif (x == 1) and spaceavailable
then // there is space to write

     new_writesignal:= not(writesignal);
     new_x := 2;
          
else  // hold
      new_x := x;
      
end if;

end WriteToFIFO;


