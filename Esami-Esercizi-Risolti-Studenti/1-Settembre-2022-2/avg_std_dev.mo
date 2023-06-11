// Blocco che calcola sempre la deviazione standard e la media di un parametro
block AvgStdDev
InputBoolean clock; // All'edge di questo, si scatena il calcolo

OutputReal avg;
OutputReal stdDev;

Integer counter;
Real y2, Var, TimeLast, v;

initial equation

  counter = 0;
  avg = 0;
  stdDev = 0;
  Var = 0;
  v = 0;
  TimeLast = 0;

algorithm


when edge(clock) then

      v := (time - TimeLast);
      avg := avg*(counter/(counter + 1)) + v/(counter + 1) ;
      y2 := y2*(counter/(counter + 1)) + (v^2)/(counter + 1) ;

      Var := y2 - (avg^2);
      stdDev := sqrt(Var);
      
      counter := counter + 1;
      TimeLast := time;
      
end when;

end AvgStdDev;

// =================================================================================================

// Variazione con anche il costo
block CostAvgStdDev
InputBoolean clock; // All'edge di questo, si scatena il calcolo

//! Mi serve numero del team
InputInteger k;

OutputReal avg;
OutputReal stdDev;

Integer counter;
Real y2, Var, TimeLast, v;

initial equation

  counter = 0;
  avg = 0;
  stdDev = 0;
  Var = 0;
  v = 0;
  TimeLast = 0;

algorithm


when edge(clock) then 

      v := costPerDay(k) * (time - TimeLast);
      avg := avg*(counter/(counter + 1)) + v/(counter + 1) ;
      y2 := y2*(counter/(counter + 1)) + (v^2)/(counter + 1) ;

      Var := y2 - (avg^2);
      stdDev := sqrt(Var);
      
      counter := counter + 1;
      TimeLast := time;
      
end when;

end CostAvgStdDev;



// =================================================================================================


block CostAllAvgStdDev
InputBoolean clock; // All'edge di questo, si scatena il calcolo

OutputReal avg;
OutputReal stdDev;

Integer counter;
Real y2, Var, TimeLast, v;

initial equation

  counter = 0;
  avg = 0;
  stdDev = 0;
  Var = 0;
  v = 0;
  TimeLast = 0;

algorithm


when edge(clock) then 

      v := all_costs() * (time - TimeLast);
      avg := avg*(counter/(counter + 1)) + v/(counter + 1) ;
      y2 := y2*(counter/(counter + 1)) + (v^2)/(counter + 1) ;

      Var := y2 - (avg^2);
      stdDev := sqrt(Var);
      
      counter := counter + 1;
      TimeLast := time;
      
end when;

end CostAllAvgStdDev;

function all_costs
  output Real cost;
algorithm
  cost := 0;
  for k in 1:K.W loop
    cost := cost + costPerDay(k);
  end for;
end all_costs;