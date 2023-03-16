
block Server

parameter Real Tserver = K.T/10;

parameter Real DeltaClean = 1.0;

// client input queue (ciq) where server sends data to client1
OutputInteger inputdata1[1];
OutputBoolean writesignal1;
InputBoolean spaceavailable1;

// client input queue (ciq) where server sends data to client2
OutputInteger inputdata2[1];
OutputBoolean writesignal2;
InputBoolean spaceavailable2;


// server input queue (siq) where server receives data from client1
OutputBoolean readsignal1;
InputInteger outputdata1[3];
InputBoolean datavailable1;  

// server input queue (siq) where server receives data from client2
OutputBoolean readsignal2;
InputInteger outputdata2[3];
InputBoolean datavailable2;  

OutputBoolean DB[K.N, K.Q, K.W];   // DB storing reservations

Integer state;

Integer Value2Client[2];
Integer ValueFromClient[2,3];
Boolean ReqFromCPresent[2];

Integer sid, cid, tid;

Real CTimer;

algorithm


when initial() then

CTimer := 0;

writesignal1 := false;
writesignal2 := false;
readsignal1 := false;
readsignal2 := false;
inputdata1[1] := 0;
inputdata2[1] := 0;
state := 0;
sid := 0;
cid := 0;
tid := 0;

for i in 1:2 loop  ReqFromCPresent[i] := false; end for;

for i in 1:2 loop  Value2Client[i] := 0; end for;

for i in 1:2 loop
    for j in 1:3 loop
       ValueFromClient[i,j] := 0;
    end for;
end for;

for n in 1:K.N loop
    for q in 1:K.Q loop
        for w in 1:K.W loop
	    DB[n, q, w] := false;   /// empty DB
	end for;
    end for;
end for;

elsewhen sample(0, Tserver) then

CTimer := pre(CTimer) + Tserver;

if (state == 0) and (CTimer >= DeltaClean) 
then  // check cleanup time

for n in 1:K.N loop
    for q in 1:K.Q loop
        for w in 1:K.W loop
	    if (w < mod(time, K.W) + 1) then DB[n, q, w] := false; end if;
	end for;
    end for;
end for;

  state := 5;

elseif (state == 0) and not(CTimer >= DeltaClean) 
then  // keep going

  state := 7;
  
elseif (state == 5) 
then  // reset timer

  CTimer := 0.0;
  
  state := 0;
  
elseif (state == 7) 
then // check reqs

     if pre(datavailable1)
     then ReqFromCPresent[1] := true; else ReqFromCPresent[1] := false;
     end if;

     if pre(datavailable2)
     then ReqFromCPresent[2] := true; else ReqFromCPresent[2] := false;
     end if;

     state := 10;

elseif (state == 10) 
then // ask values to clients
      if ReqFromCPresent[1] then readsignal1 := not(pre(readsignal1)); end if;
      if ReqFromCPresent[2] then readsignal2 := not(pre(readsignal2)); end if;
      state := 20;
     
elseif (state == 20)
then  // read from clients

    if ReqFromCPresent[1] then ValueFromClient[1] := pre(outputdata1); end if;
    if ReqFromCPresent[2] then ValueFromClient[2] := pre(outputdata2); end if;   
    state := 30;  // process requests

elseif (state == 30)
then  // process reqs

for i in 1:2 loop
     if ReqFromCPresent[i] 
     then
          sid := ValueFromClient[i, 1];   // student id
	  cid := ValueFromClient[i, 2];   // class id
	  tid := ValueFromClient[i, 3];   // time slot id
	  
        if (NumStudentInClass(DB, cid, tid) < K.K)
	then  // reservation only if class not too crowded
          if DB[sid, cid, tid]
	  then // req already present
	  	  
	       Value2Client[i] := 2;  // should be 2
	       
	  else // new req

              Value2Client[i] := 1;  // should be 1
	       DB[sid, cid, tid] := true;
	  end if;
	else // request refused
	   Value2Client[i] := 3;  // should be 3 (not specified)
	end if;   // class not too crowded
     end if;
end for;

     inputdata1[1] := Value2Client[1];
     Value2Client[1] := 0;  // reset
     
     inputdata2[1] := Value2Client[2];
     Value2Client[2] := 0;  // reset 

     state := 40;
     
elseif (state == 40)
then  // send data to clients

if  ReqFromCPresent[1] then writesignal1 := not(pre(writesignal1)); end if;
if  ReqFromCPresent[2] then writesignal2 := not(pre(writesignal2)); end if;

    state := 0;  // loop

else

    state := pre(state);
    
end if;


end when;



end Server;

