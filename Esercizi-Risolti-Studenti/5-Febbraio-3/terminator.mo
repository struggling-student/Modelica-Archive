block Terminator

AvgStdDev calc;
InputReal e;

equation
calc.param = e;

algorithm
when (time > Prm.HORIZON) then
    // Terminate the simulation
    Modelica.Utilities.Files.remove("outputs.txt");

    Modelica.Utilities.Streams.print("AvgErr  StdDevErr   (ID = "+String(Prm.ID)+", MyMagicNumber = "+String(Prm.MyMagicNumber)+", HORIZON = "+String(Prm.HORIZON)+", time = "+String(time)+")", "outputs.txt");
    
    // Print the results
    
    Modelica.Utilities.Streams.print(
        String(calc.avg) + " " + 
        String(calc.stdDev), "outputs.txt"
    );
    

    terminate("Terminated since max time reached");
end when;

end Terminator;