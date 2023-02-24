
block CompletionTime

InputInteger x;  // state of development cycle from DTMC, team k

OutputReal y;  // valore atteso tempo di completamento

OutputReal z;  // StdDev (deviazione standard) completion time

Integer counter;    
Boolean delivery;
Real v;  // completion time
Real TimeLastDelivery;
Real y2;  // Second order moment for development completion time
Real Var;  // Variance completion time

initial equation

  counter = 0;
  y = 0;
  z = 0;
  Var = 0;
  v = 0;
  TimeLastDelivery = 0;


equation

    delivery = (x == Prm.N);

algorithm


when edge(delivery)  then

      v := (time - TimeLastDelivery);
      y := y*(counter/(counter + 1)) + v/(counter + 1) ;
      y2 := y2*(counter/(counter + 1)) + (v^2)/(counter + 1) ;

      Var := y2 - (y^2);
      z := sqrt(Var);
      
      counter := counter + 1;
      TimeLastDelivery := time;
      
end when;


end CompletionTime;

