
block Monitor


InputReal Z[N, Q];   // Z[i, j]:  vital parameter j for patient i

OutputReal AvgZ[N, Q];  // AvgZ[i, j] is the time average of Z[i, j]

OutputReal StddevZ[N, Q];  // stddevY[i]: Standard deviation of Z[i, j]


// compute AvgZ, StddevZ here



// terminator

algorithm


// adjust as needed 

when (max(StddevZ) <= 1.0) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Sottosistema Sensore Avg StdDev (time = " + String(time) " )", "outputs.txt");
    
    for i in 1:N loop
        for j in 1:Q loop 
         Modelica.Utilities.Streams.print(String(i) + "  " + String(j) + "  " + String(AvgZ[i, j]) + "  " + String(StddevZ[i, j]), "outputs.txt");     
        end for;
    end for;
   
    terminate("Standard deviation small enough");
end when;





end Monitor;

