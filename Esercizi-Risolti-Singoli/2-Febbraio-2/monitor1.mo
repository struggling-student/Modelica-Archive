block Monitor1
// Calcola avg e std dev per ogni componente di ogni tripla generata da ENV (senza fifo, diretto)
AvgStdDevT calcT;

InputInteger request[2]; // oppure no-op

Boolean clock;

equation

calcT.clock = clock;

algorithm

when initial() then
clock := false;
elsewhen sample(0, 1) then
    // Controlla se env ha una richiesta valida
    if pre(request[1]) > 0 and pre(request[2]) > 0 then
        clock := not(pre(clock));
    end if;
end when;

    // Terminazione
    when time > Prm.HORIZON then
        // Terminate the simulation
    Modelica.Utilities.Files.remove("outputs.txt");

    Modelica.Utilities.Streams.print("Avg StdDev   (ID = "+String(Prm.ID)+", MyMagicNumber = "+String(Prm.MyMagicNumber)+", HORIZON = "+String(Prm.HORIZON)+", time = "+String(time)+")", "outputs.txt");
    
    // Print the results
    Modelica.Utilities.Streams.print(
        String(pre(calcT.avg)) + " " +
        String(pre(calcT.stdDev)),
        "outputs.txt"
    );

    terminate("Terminated since max time reached");
    end when;
end Monitor1;