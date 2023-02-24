
record fifoc2sparam

parameter Integer M = 1;  // size IO array
parameter Integer N = 100;  // fifo size

end fifoc2sparam;



block Client2Server

// siq

fifoc2sparam p;

// read side
InputBoolean readsignal;
OutputInteger outputdata[p.M];
OutputBoolean datavailable;  

// write side
InputBoolean writesignal;  
InputInteger inputdata[p.M]; 
OutputBoolean spaceavailable;  

Integer fifo[p.N, p.M];  // fifo of input msg
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

for j in 1:p.M loop
    outputdata[j] := 0;
end for;

for i in 1:p.N loop
    for j in 1:p.M loop
       fifo[i,j] := 0;
    end for; // j
end for; // i


elsewhen (readsigint and writesigint ) then

//assert(false, "channel: Simultaneous read and write", AssertionLevel.warning);


if (pre(fifosize) < p.N)
 then
    // write
    for j in 1:p.M loop
       fifo[pre(newest), j] := inputdata[j];
    end for;
    
    newest := mod(pre(newest), p.N) + 1; // mod(pre(newest) + 1 - 1, p.N) + 1

    //  read
    for j in 1:p.M loop
       outputdata[j] := fifo[pre(oldest), j] ;
    end for;
    
    oldest := mod(pre(oldest), p.N) + 1 ;

else  // pre(fifosize) >= p.N
//  read

    for j in 1:p.M loop
       outputdata[j] := fifo[pre(oldest), j] ;
    end for; 
       
       oldest := mod(pre(oldest), p.N) + 1;
  
// write
    for j in 1:p.M loop
       fifo[pre(newest), j] := inputdata[j];
    end for; 

    newest := mod(pre(newest), p.N) + 1; // mod(pre(newest) + 1 - 1, p.N) + 1

end if;


elsewhen (readsigint and not(writesigint) and  (pre(fifosize) >= 1) ) then


// there is something to read

//assert(false, "channel: Just read", AssertionLevel.warning);

    for j in 1:p.M loop
       outputdata[j] :=  fifo[pre(oldest), j] ;
    end for; 
 
    fifosize := pre(fifosize) - 1;
    spaceavailable := true;
    datavailable := if (fifosize >= 1) then true else false;
    oldest := mod(pre(oldest), p.N) + 1;

elsewhen (not(readsigint) and writesigint and  (pre(fifosize) < p.N)  ) then
	  
//assert(false, "channel: Just write", AssertionLevel.warning);


// there is space for writing
  
   for j in 1:p.M loop
     fifo[pre(newest), j] := inputdata[j];
   end for;
   
    newest := mod(pre(newest), p.N) + 1;
    fifosize := pre(fifosize) + 1;
    datavailable := true;
    spaceavailable := if (fifosize < p.N) then true else false;
    
   for j in 1:p.M loop
    outputdata[j] :=  fifo[pre(oldest), j] ;
   end for;
 
end when;


end Client2Server;