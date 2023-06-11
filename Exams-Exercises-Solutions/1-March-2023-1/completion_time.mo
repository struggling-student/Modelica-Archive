
block CompletionTime

InputInteger x;  
OutputReal y;  
OutputReal z;  

Integer counter;   
Boolean delivery;
Real v;  
Real TimeLastDelivery;
Real y2;  
Real Var; 

initial equation

  counter = 0;
  y = 0;
  z = 0;
  Var = 0;
  v = 0;
  TimeLastDelivery = 0;
  y2=0;


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

