// Blocco che calcola sempre la deviazione standard e la media di un parametro
block AvgStdDev
InputReal param; // Parametro di cui calcolare le cose

OutputReal avg;
OutputReal stdDev;

Integer counter;
Real y2, Var, v;

initial equation

  counter = 0;

  avg = 0;
  stdDev = 0;

  Var = 0;
  v = 0;
  y2 = 0;

algorithm


when sample(0, Prm.T) then

      v := param;
      avg := avg*(pre(counter)/(pre(counter) + 1)) + v/(pre(counter) + 1) ;
      y2 := y2*(pre(counter)/(pre(counter) + 1)) + (v^2)/(pre(counter) + 1) ;

      Var := y2 - (avg^2);
      stdDev := sqrt(Var);
      
      counter := pre(counter) + 1;
      
end when;

end AvgStdDev;