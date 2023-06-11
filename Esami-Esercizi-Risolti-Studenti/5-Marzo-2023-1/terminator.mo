block Terminator

InputReal y[2];
InputReal z[2];

//Modelica.Math.BooleanVectors.allTrue(termcond) and 

algorithm
    when (time > K.HORIZON) then
        Modelica.Utilities.Files.remove("outputs.txt");
        Modelica.Utilities.Streams.print("ComponenteIndex AvgErr StdDevErr (ID=" + String(K.ID) + ", MyMagicNumber=" + String(K.MyMagicNumber) + ", HORIZON=" + String(K.HORIZON) + ", time=" + String(time) + ")", "outputs.txt");

        Modelica.Utilities.Streams.print(String(y[1]) + " " + String(z[1]) + " " + String(y[2]) + " " + String(z[2]), "outputs.txt");


        terminate("Terminated by the terminator!");
    end when;

end Terminator;