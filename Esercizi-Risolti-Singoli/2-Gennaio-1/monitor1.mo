block Monitor1

InputReal yVal[3];
InputReal zVal[3];

InputReal yTime;
InputReal zTime;

Prm p;

algorithm
    when (time > p.HORIZON) then
        Modelica.Utilities.Files.remove("outputs.txt");
        Modelica.Utilities.Streams.print("Avg1 StdDev1 Avg2 StdDev2 Avg3 StdDev3 AvgWait StdWait (ID=" + String(p.ID) + ", MyMagicNumber=" + String(p.MyMagicNumber) + ", HORIZON=" + String(p.HORIZON) + ", time=" + String(time) + ")", "outputs.txt");

        Modelica.Utilities.Streams.print(String(yVal[1]) + " " + String(zVal[1]) + " " + String(yVal[2]) + " " + String(zVal[2]) + " " + String(yVal[3]) + " " + String(zVal[3]) + " " + String(yTime) + " " + String(zTime), "outputs.txt");

        terminate("Terminato dal blocco Terminator");
    end when;

end Monitor1;
