block Monitor

InputReal y[K.W];  // y[k]: Expected value for development completion time for team k

InputReal z[K.W];  // z[k]: StdDev for development completion for team k

InputReal yC[K.W];  // Expected value for development cost for team k

InputReal zC[K.W];  // StdDev value for development cost for team k

InputBoolean termcond[K.W]; // termination condition for team k




algorithm

when ((time >= 5000) and (Modelica.Math.BooleanVectors.allTrue(termcond)) or (time >= 10000)) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("A B C D F G Team AvgTime AvgCost StdDevTime StdDevCost (ID=" + String(K.ID) + ", MyMagicNumber=" + String(K.MyMagicNumber) + ", time=" + String(time) + ")", "outputs.txt");

    for i in 1:K.W loop 
         Modelica.Utilities.Streams.print(String(K.A) + " " + String(K.B) + " " + String(K.C) + " " + String(K.D) + " " + String(K.F) + " " + String(K.G) + " " + String(i) + " " + String(y[i]) + " " + String(yC[i]) + " " + String(z[i]) + " " + String(zC[i]), "outputs.txt");
    end for;

    terminate("Terminato dal monitor. Condizioni di terminazione soddisfatte.");
end when;


end Monitor;
