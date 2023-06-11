
model Terminator

InputReal y[Prm.N, Prm.Q];


algorithm

// adjust as needed 

when (time > 500*Prm.N*Prm.Q) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Sottosistema Sensore MobileAvg (stop time = " + String(time) + " )", "outputs.txt");
    
    for i in 1:Prm.N loop
        for j in 1:Prm.Q loop 
          Modelica.Utilities.Streams.print(String(i) + "  " + String(j) + "  " + String(y[i, j]), "outputs.txt");
	end for;
    end for;
   
    terminate("Terminated since max time reached");
end when;


end Terminator;
