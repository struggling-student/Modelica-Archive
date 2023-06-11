
block Monitor

Prm q;   // parametri

InputInteger x[q.W];  // state of development cycle from DTMC

OutputReal y[q.W];  // y[i]: Expected value for development completion time for team 

OutputReal z[q.W];  // z[i]: Expected value for development cost for team i

//OutputReal stddevY[q.W];  // stddevY[i]: Standard deviation value for development completion time for team i.

//OutputReal stddevZ[q.W];  // stddevZ[i]: Standard deviation value for development cost for team i.


// compute y, z, stddevY, stddevZ  here
Integer counter[q.W];    
Boolean delivery[q.W];




initial equation
for i in 1:q.W loop
         counter[i] = 0;
         y[i] = 0;
end for;

equation

for i in 1:q.W loop
         delivery[i] = (x[i] == q.N);
	 z[i] = Cost(q, i)*y[i];
end for;


algorithm

when  sample(0, q.T) then

for i in 1:q.W loop
   if edge(delivery[i]) then
      counter[i] := counter[i] + 1;
      y[i] := time/counter[i];
   end if;
end for;



// terminator





// adjust as needed 

// elsewhen (max(stddevY) <= 1.0) then

//     Modelica.Utilities.Files.remove("outputs.txt");
//     Modelica.Utilities.Streams.print("Team AvgTime AvgCost StdDevTime StdDevCost (time = " + String(time) " )", "outputs.txt");
    
//     for i in 1:q.W loop 
//          Modelica.Utilities.Streams.print(String(i) + "  " + String(y[i]) + "  " + String(z[i]) + "  " + String(stddevY[i]) + "  " + String(stddevZ[i]), "outputs.txt");     
//     end for;
   
//     terminate("Standard deviation small enough for reliable estimate");
end when;




end Monitor;

