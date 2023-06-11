block CompletionBlock

InputInteger x;  // state of development cycle from DTMC
InputInteger k;

OutputReal y;  // Expected value for development completion time
OutputReal yC; // Expected value for development cost

OutputReal stdev;
OutputReal stdevC;

OutputBoolean termcond;

Integer counter;    
Boolean delivery;

Real Var;
Real yt2;

Real tld;
Real phase_duration; // completion time

initial equation
counter = 0;
y = 0;

tld = 0;
phase_duration = 0;

equation
    delivery = (x == K.N);
    termcond = (stdev <= (0.1 * y));

algorithm
    when edge(delivery) then
          phase_duration := time - tld;

          y := y * (counter / (counter + 1)) + phase_duration / (counter + 1);
          yt2 := yt2 * (counter / (counter + 1)) + (phase_duration^2) / (counter + 1);

          counter := counter + 1;

          //yt2 := y^2 + y^2 * (counter - 1) / counter;
          //y := time / counter;
          yC := y * DailyCost(k);

          tld := time;
        // y is expected value of x, counter is number of samples, compute variance of x
        // we know variance is E(x^2) - E(x)^2
        // E(x^2) = y^2 + y^2 * (counter - 1) / counter
        Var := yt2 - y^2;
        stdev := sqrt(Var);
        stdevC := stdev * DailyCost(k);
        

    end when;

end CompletionBlock;
