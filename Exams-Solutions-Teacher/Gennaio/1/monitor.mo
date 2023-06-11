
block Monitor

Prm p;   // parametri

InputInteger x[p.W];  // state of development cycle from DTMC

OutputReal y[p.W];  // y[i]: Expected value for development completion time for team 

OutputReal z[p.W];  // z[i]: Expected value for development cost for team i


Integer counter[p.W];    
Boolean delivery[p.W];


initial equation
for i in 1:p.W loop
         counter[i] = 0;
         y[i] = 0;
end for;

equation

for i in 1:p.W loop
         delivery[i] = (x[i] == p.N);
	 z[i] = Cost(p, i)*y[i];
end for;


algorithm

when  sample(0, p.T) then

for i in 1:p.W loop
   if edge(delivery[i]) then
      counter[i] := counter[i] + 1;
      y[i] := time/counter[i];
   end if;
end for;

end when;






end Monitor;

