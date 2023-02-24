
block Monitor

Prm p;   // parametri

InputInteger x;  // state of development cycle from DTMC

OutputReal y[p.W];  // y[i]: Expected value for development completion time for team 

OutputReal z[p.W];  // z[i]: Expected value for development cost for team i

OutputReal stddevY[p.W];  // stddevY[i]: Standard deviation value for development completion time for team i.

OutputReal stddevZ[p.W];  // stddevZ[i]: Standard deviation value for development cost for team i.


// compute y, z, stddevY, stddevZ  here



// terminator

algorithm


// adjust as needed 

when (max(stddevY) <= 1.0) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Team AvgTime AvgCost StdDevTime StdDevCost (time = " + String(time) " )", "outputs.txt");
    
    for i in 1:p.W loop 
         Modelica.Utilities.Streams.print(String(i) + "  " + String(y[i]) + "  " + String(z[i]) + "  " + String(stddevY[i]) + "  " + String(stddevZ[i]), "outputs.txt");     
    end for;
   
    terminate("Standard deviation small enough for reliable estimate");
end when;




end Monitor;

