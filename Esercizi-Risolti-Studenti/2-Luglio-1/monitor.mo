block Monitor

Prm p;

InputReal X[p.N, p.Q];

OutputInteger signal;

parameter Real T = 1;

Real V[p.N, p.Q, p.K+1];
Real media[p.N*p.Q];
Real tempavg;

algorithm

when initial() then

for i in 1:p.N loop
  for j in 1:p.Q loop
    for k in 1:p.K+1 loop
        if (k == 1) then
            V[i,j,k] := 2;
        else 
            V[i,j,k] := -1000;
        end if;
    end for;
  end for;
end for;

for k in 1:p.N*p.Q loop
    media[k] := 0;
end for;

tempavg := 0;

elsewhen (time > (500 * p.N * p.Q)) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Sottosistema Sensore MobileAvg", "outputs.txt");
    
    for i in 1:p.N loop
      for j in 1:p.Q loop 
         Modelica.Utilities.Streams.print(String(i) + "  " + String(j) + "  " + String(media[i*j]), "outputs.txt");     
      end for;
    end for;
   
    terminate("Time finished");

elsewhen sample(0,T) then

for i in 1:p.N loop
  for j in 1:p.Q loop
        
        // read sensor value
        V[i,j,integer(V[i,j,1])] := X[i,j];

        // update pointer to last value
        V[i,j,1] := mod(V[i,j,1] + 1, p.K+1)+2; 
        
        // update mean
        for k in 2:p.K+1 loop
            if not(integer(V[i,j,k]) == -1000) then  
                tempavg := tempavg + V[i,j,k];
            end if;
        end for;
        if (integer(V[i,j,p.K+1]) == -1000) then
            tempavg := tempavg / (V[i,j,1]-1);
        else
            tempavg := tempavg / p.K;
        end if;
        media[i*j] := tempavg;

        // send alert

        if (X[i,j] < (media[i*j] - 0.2*media[i*j])) then
            signal := -1;
        elseif (X[i,j] > (media[i*j] + 0.1*media[i*j])) then
            signal := 1;
        else 
            signal := 0;
        end if;

  end for;
end for;

end when;


end Monitor;