
block Monitor


InputReal y[Prm.W];  // y[k]: Expected value for development completion time for team k

InputReal z[Prm.W];  // z[k]: StdDev for development completion for team k

OutputReal Avgcost[Prm.W];  // Expected value for development cost for team k

OutputReal StdDevCost[Prm.W];  // StdDev value for development cost for team k


equation

for k in 1:Prm.W loop

Avgcost[k] = Cost(k)*y[k];
StdDevCost[k] = Cost(k)*z[k];

end for;



// terminator

algorithm


// adjust as needed 

when (((max(z) <= 130.0) and (time > 40000)) or (time >= 100000)) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Team AvgTime AvgCost StdDevTime StdDevCost (time = " + String(time) + " )", "outputs.txt");
    
    for i in 1:Prm.W loop 
         Modelica.Utilities.Streams.print(String(i) + "  " + String(y[i]) + "  " + String(Avgcost[i]) + "  " + String(z[i]) + "  " + String(StdDevCost[i]), "outputs.txt");     
    end for;
   
    terminate("Standard deviation completion time  small enough for reliable estimate");
end when;




end Monitor;

