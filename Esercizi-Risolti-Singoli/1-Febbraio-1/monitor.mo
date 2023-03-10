
block Monitor

InputInteger x[K.W];  // state of development cycle from DTMC, for each team

OutputReal times[K.W];  // y[i]: Expected value for development completion time for team 

OutputReal costs[K.W];  // z[i]: Expected value for development cost for team i

OutputReal stddevTime[K.W];  // stddevY[i]: Standard deviation value for development completion time for team i.

OutputReal stddevCost[K.W];  // stddevZ[i]: Standard deviation value for development cost for team i.

//! Strumenti per calcolare i valori, altrimenti edge() di uno di array è impossibile
AvgStdDev calcTimes[K.W];
CostAvgStdDev calcCosts[K.W];

// Info extra sull'intero progetto
AvgStdDev calcTimesAll;
CostAllAvgStdDev calcCostsAll;

initial equation 
    for i in 1:K.W loop
        times[i] = 0.0;
        costs[i] = 0.0;
        stddevTime[i] = 0.0;
        stddevCost[i] = 0.0;
    end for;
equation

//* Imposta parametri e clock per AvgStdDev
for i in 1:K.W loop
    // Clock = quando scatta l'edge
    calcTimes[i].clock = x[i] == K.N;
    calcCosts[i].clock = x[i] == K.N;
    calcCosts[i].k = i;
end for;

calcTimesAll.clock = all_n(x);
calcCostsAll.clock = all_n(x);

//* Imposta gli output
for i in 1:K.W loop
    times[i] = calcTimes[i].avg;
    stddevTime[i] = calcTimes[i].stdDev;
    costs[i] = calcCosts[i].avg;
    stddevCost[i] = calcCosts[i].stdDev;
end for;

//* Fine simulazione e print sul file outputs.txt
algorithm

when ((time > 1000 and is_ok(times, stddevTime)) or time >= 10000) then
    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Team AvgTime AvgCost StdDevTime StdDevCost (ID = "+String(K.ID)+", MyMagicNumber = "+String(K.MyMagicNumber)+", time = " + String(time) + " )", "outputs.txt");
    Modelica.Utilities.Streams.print(
        "A = " + String(K.A) +
        ", B = " + String(K.B) +
        ", C = " + String(K.C) +
        ", D = " + String(K.D) +
        ", F = " + String(K.F) +
        ", G = " + String(K.G) +
        ", N = " + String(K.N) +
        ", W = " + String(K.W) +
        ", AvgTime = " + String(calcTimesAll.avg) +
        ", AvgCosto = " + String(calcCostsAll.avg),
    "outputs.txt");

    for i in 1:K.W loop 
         Modelica.Utilities.Streams.print(
            String(i) + " " +
            String(times[i]) + " " +
            String(costs[i]) + " " +
            String(stddevTime[i]) + " " +
            String(stddevCost[i]),
        "outputs.txt");     
    end for;
   
    terminate("Standard deviation small enough for reliable estimate");
end when;




end Monitor;

function is_ok
    input Real times[K.W];
    input Real stddevTime[K.W];
    output Boolean ok;
    
    algorithm
        ok := true;
        for i in 1:K.W loop
            if stddevTime[i] > 0.1 * times[i] then
                ok := false;
            end if;
        end for;
end is_ok;


function all_n
    input Integer[K.W] teams;
    output Boolean n;
algorithm
    n := true;
    // And all teams
    for i in 1:K.W loop
        if teams[i] < K.N then
            n := false;
        end if;
    end for;
end all_n;

