block Terminator

InputBoolean termcond[3];

InputReal y[3];
InputReal z[3];

//Modelica.Math.BooleanVectors.allTrue(termcond) and 

algorithm
    when (time > K.HORIZON) then
        Modelica.Utilities.Files.remove("outputs.txt");
        Modelica.Utilities.Streams.print("p k1 k2 Component  AvgValue StdDevValue (ID=" + String(K.ID) + ", MyMagicNumber=" + String(K.MyMagicNumber) + ", HORIZON=" + String(K.HORIZON) + ", time=" + String(time) + ")", "outputs.txt");

        for i in 1:3 loop
            Modelica.Utilities.Streams.print(String(K.p) + " " + String(K.k1) + " " + String(K.k2) + " " + String(i) + " " + String(y[i]) + " " + String(z[i]), "outputs.txt");
        end for;

        terminate("Terminated by the terminator!");
    end when;

end Terminator;

