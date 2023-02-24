block FIFO

parameter Integer M = 2;  // size IO array
parameter Integer N = 100;  // fifo size

// read side

InputBoolean readsignal;
OutputInteger readfifodata[M];   // outputdata
OutputBoolean datavailable;  

// write side
InputBoolean writesignal;  
InputInteger writefifodata[M];  // inputdata
OutputBoolean spaceavailable;  

Integer fifo[N, M];  // fifo of input msg
Integer oldest; 
Integer newest; 
Integer fifosize;

Boolean readsigint;  
Boolean writesigint;

equation

readsigint = not(pre(readsignal) == readsignal) ;
writesigint = not(pre(writesignal) == writesignal) ;


algorithm

when initial() then

datavailable := false;
spaceavailable := true;
fifosize := 0;
oldest := 1;   // where to read
newest := 1;   //  where to write

for j in 1:M loop
    readfifodata[j] := 0;
end for;

for i in 1:N loop
    for j in 1:M loop
       fifo[i,j] := 0;
    end for; // j
end for; // i


elsewhen (readsigint and writesigint ) then

//assert(false, "channel: Simultaneous read and write", AssertionLevel.warning);


if (pre(fifosize) < N)
 then
    // write
    for j in 1:M loop
       fifo[pre(newest), j] := writefifodata[j];
    end for;
    
    newest := mod(pre(newest), N) + 1; // mod(pre(newest) + 1 - 1, N) + 1

    //  read
    for j in 1:M loop
       readfifodata[j] := fifo[pre(oldest), j] ;
    end for;
    
    oldest := mod(pre(oldest), N) + 1 ;

else  // pre(fifosize) >= N
//  read

    for j in 1:M loop
       readfifodata[j] := fifo[pre(oldest), j] ;
    end for; 
       
       oldest := mod(pre(oldest), N) + 1;
  
// write
    for j in 1:M loop
       fifo[pre(newest), j] := writefifodata[j];
    end for; 

    newest := mod(pre(newest), N) + 1; // mod(pre(newest) + 1 - 1, N) + 1

end if;


elsewhen (readsigint and not(writesigint) and  (pre(fifosize) >= 1) ) then


// there is something to read

//assert(false, "channel: Just read", AssertionLevel.warning);

    for j in 1:M loop
       readfifodata[j] :=  fifo[pre(oldest), j] ;
    end for; 
 
    fifosize := pre(fifosize) - 1;
    spaceavailable := true;
    datavailable := if (fifosize >= 1) then true else false;
    oldest := mod(pre(oldest), N) + 1;

elsewhen (not(readsigint) and writesigint and  (pre(fifosize) < N)  ) then
	  
//assert(false, "channel: Just write", AssertionLevel.warning);


// there is space for writing
  
   for j in 1:M loop
     fifo[pre(newest), j] := writefifodata[j];
   end for;
   
    newest := mod(pre(newest), N) + 1;
    fifosize := pre(fifosize) + 1;
    datavailable := true;
    spaceavailable := if (fifosize < N) then true else false;
    
   for j in 1:M loop
    readfifodata[j] :=  fifo[pre(oldest), j] ;
   end for;
 
end when;


end FIFO;