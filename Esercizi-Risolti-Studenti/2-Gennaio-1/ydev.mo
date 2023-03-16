// Blocco che calcola sempre la deviazione standard e la media di un prmetro
block YDev
InputBoolean clk; // All'edge di questo, si scatena il calcolo
InputReal prm; // prmetro di cui calcolare le cose
OutputReal y;
OutputReal stdDev;
OutputBoolean termcond;

Prm p;

Integer counter;
Real y2, Var, TimeLast, v;

initial equation
  counter = 0;
  y = 0;
  stdDev = 0;
  Var = 0;
  v = 0;
  TimeLast = 0;

algorithm
when not(clk == pre(clk)) then//!edge(clk)  then
      v := prm;//!(time - TimeLast);
      y := y*(counter/(counter + 1)) + v/(counter + 1);
      y2 := y2*(counter/(counter + 1)) + (v^2)/(counter + 1);
      Var := y2 - (y^2);
      stdDev := sqrt(Var);
      counter := counter + 1;
      TimeLast := time;

      termcond := false; // per ora la ignoro
end when;
end YDev;