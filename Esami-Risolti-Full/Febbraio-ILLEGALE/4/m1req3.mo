
block M1Req3

// True se Req3 è violato, false altrimenti.

InputBoolean readsignal1;
InputBoolean writesignal1;
InputInteger outputdata1[3];
InputInteger inputdata1[1];
InputBoolean DB[K.N, K.Q, K.W];

OutputBoolean y1;   

Integer sid, cid, tid, state;

Boolean newevent, isnewvalue, isoldvalue;


equation

newevent = not(readsignal1 == pre(readsignal1)) or not(writesignal1 == pre(writesignal1));


algorithm

when initial() then

y1 := false;

state := 0;
isnewvalue := false;
isoldvalue := false;

elsewhen newevent  then


if (state == 0) and not(readsignal1 == pre(readsignal1))

then  // update DB
      sid := pre(outputdata1[1]);   // student id
      cid := pre(outputdata1[2]);   // class id
      tid := pre(outputdata1[3]);   // time slot id

      if not(DB[sid, cid, tid])
      then 
	  isnewvalue := true;
      else
         isoldvalue := true;
      end if; 

      state := 100;
        
elseif (state == 100)  and not(writesignal1 == pre(writesignal1))
then  // check results

      if  (isoldvalue and (inputdata1[1] == 1))
      then // error
          y1 := true;
      end if;


isnewvalue := false;
isoldvalue := false;

     state := 0;


else
     state := pre(state);
     
end if;




end when;


end M1Req3;

