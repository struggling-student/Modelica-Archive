
block Monitor


InputReal y[Prm.W];  // y[k]: Expected value for development completion time for team k

InputReal z[Prm.W];  // z[k]: StdDev for development completion for team k

OutputReal Avgcost[Prm.W];  // Expected value for development cost for team k

OutputReal StdDevCost[Prm.W];  // StdDev value for development cost for team k

Real avgcostototale;
Real avgtimetotale;



Boolean endCondition;


equation

for k in 1:Prm.W loop

Avgcost[k] = Cost(k)*y[k];
StdDevCost[k] = Cost(k)*z[k];

end for;


algorithm

    
when sample(0, Prm.T) then
    endCondition := true;

    if (time > 10000) then // value smaller than the one in "simulate.mos", if reached terminate simulation
        endCondition := true; // finished

    elseif (time > 5000) then // start checking if end condition is met: this is so the value stabilizes in the first 40000 simulations
        for w in 1:Prm.W loop
            if (pre(y[w]) * pre(z[w]) > 1.0) then
                endCondition := false;
                break;
            end if;
        end for;
    else 
        endCondition := false; // we havent reached yet the 40000 mark
    end if;


    if (endCondition) then

        Modelica.Utilities.Files.remove("outputs.txt"); 
        Modelica.Utilities.Streams.print("Dipendente AvgTime AvgCost StdDevTime StdDevCost (ID = " + String(Prm.ID) + ", MyMagicNumber = " + String(Prm.MyMagicNumber) + ", time = " + String(time) + " )", "outputs.txt");
    
        for i in 1:Prm.W loop
            avgcostototale := avgcostototale + Avgcost[i];
            avgtimetotale := avgtimetotale + y[i];
        end for;

        avgcostototale := avgcostototale / Prm.W;
        avgtimetotale := avgtimetotale / Prm.W;

        Modelica.Utilities.Streams.print("A = " + String(Prm.A) + ", B = " + String(Prm.B) + ", C = " + String(Prm.C) + ", D = " + String(Prm.D) + ", F = " + String(Prm.F) + ", G = " + String(Prm.G) + ", N = " + String(Prm.N) + ", W = " + String(Prm.W) + ", Avgtime = " + String(avgtimetotale) + ", AvgCosto = " + String(avgcostototale), "outputs.txt");

        for i in 1:Prm.W loop 
            Modelica.Utilities.Streams.print(String(i) + "  " + String(y[i]) + "  " + String(Avgcost[i]) + "  " + String(z[i]) + " " + String(StdDevCost[i]), "outputs.txt");     
        end for;

        terminate("Standard deviation completion time  small enough for reliable estimate");
    
    end if;
end when;




end Monitor;

