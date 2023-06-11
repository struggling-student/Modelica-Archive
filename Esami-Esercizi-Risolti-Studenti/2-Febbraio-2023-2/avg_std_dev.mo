
block AvgStdDev
InputBoolean clock;
InputReal param;

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


when sample(0, P.T) then

if not(clock == pre(clock)) then

      v := pre(param);
      avg := pre(avg)*(counter/(counter + 1)) + v/(counter + 1) ;
      y2 := pre(y2)*(counter/(counter + 1)) + (v^2)/(counter + 1) ;

      Var := y2 - (avg^2);
      stdDev := sqrt(Var);
      
      counter := pre(counter) + 1;
      TimeLast := time;
    end if;
end when;

end AvgStdDev;




block AvgStdDevT
InputBoolean clock;

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

when not(clock == pre(clock)) then

      v := time - TimeLast;
      avg := pre(avg)*(counter/(counter + 1)) + v/(counter + 1) ;
      y2 := pre(y2)*(counter/(counter + 1)) + (v^2)/(counter + 1) ;

      Var := y2 - (avg^2);
      stdDev := sqrt(Var);
      
      counter := pre(counter) + 1;
      TimeLast := time;
end when;

end AvgStdDevT;