
block MobAvg

InputReal u;        // stream of input values
OutputReal y;        // stream of mobile average of input values


Real Buffer[Prm.K];

Integer w;   // values stored in Buffer so far
Integer last_inserted;   // 
Integer oldest_value;   // 


algorithm


when initial() then

for k in 1:Prm.K loop
   Buffer[k] := 0;
end for;

        Buffer[1] := u;
	w := 1;
        last_inserted := 1;
	oldest_value := 1;
	y:= u;
	

	
elsewhen sample(0, Prm.T) then


        if (w < Prm.K)
	then
	    y := pre(y)*(w/(w + 1)) + (u/(w + 1));
	    w := w + 1;
	    last_inserted :=  last_inserted + 1;
	else // w == Prm.K
	    y := pre(y) + (u - Buffer[oldest_value])/w;
	    oldest_value := mod(oldest_value, Prm.K) + 1;
	    last_inserted :=  mod(last_inserted, Prm.K) + 1;
        end if;

     //   Buffer[last_inserted] := u;  // This does not work, suspect bug in OMC compiler

// This implements the above assignment without generating errors !!!
for k in last_inserted:last_inserted loop
   Buffer[k] := u; 
end for;


end when;


end MobAvg;


