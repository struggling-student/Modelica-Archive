
block Monitor1
K p;
InputInteger u[2];  // reservation request

OutputReal y, Avg, StdDev;  // Expected value of time between requests


Integer counter;
Boolean request;

Real last_time, curr;  

Real y2, Var;

initial equation
counter = 0;
/*
last_time = 0.0;
curr = 0.0;
Avg = 0;
StdDev = 0;
y2 = 0;
Var = 0;
*/
y = 0;

equation

request = not((u[1] == 0) and (u[2] == 0));

algorithm
when initial() then
Avg := 0;
StdDev := 0;
y2 := 0;
Var := 0;
last_time := 0;

elsewhen edge(request)  then
      counter := counter + 1;
      y := time/counter;
      curr := time - last_time;
      
	Avg := Avg*((counter-1)/counter) + curr/(counter);
	y2 := y2*((counter-1)/counter) + (curr^2)/counter;
	Var := y2 - (Avg^2);
	
	StdDev := sqrt(Var);
	last_time := time;

  	elsewhen (time > p.HORIZON) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Avg StdDev (ID = " + String(p.ID) + ", MyMagicNumber = " + String(p.MyMagicNumber) + ", HORIZON = " + String(p.HORIZON) + ", time = " + String(time) + ")", "outputs.txt");
    

     Modelica.Utilities.Streams.print(String(Avg) + "  " + String(StdDev), "outputs.txt");     

   
    terminate("Standard deviation completion time  small enough for reliable estimate");
end when;




end Monitor1;


/*
block Monitor1

K p;
InputInteger u[2];  // reservation request
OutputReal Avg;
OutputReal StdDev;  


Integer counter;    
Boolean request;
Real y2;  // Second order 
Real Var;
Real last_time, curr_time;

initial equation
counter = 0;
Avg = 0;
StdDev = 0;
last_time = 0;
curr_time = 0;
Var = 0;
y2 = 0;
equation

request = not((u[1] == 0) and (u[2] == 0));

algorithm

when (time > p.HORIZON) then

    Modelica.Utilities.Files.remove("outputs.txt");
    Modelica.Utilities.Streams.print("Avg StdDev (ID = " + String(p.ID) + ", MyMagicNumber = " + String(p.MyMagicNumber) + ", HORIZON = " + String(p.HORIZON) + ", time = " + String(time) + ")", "outputs.txt");
    

     Modelica.Utilities.Streams.print(String() + "  " + String(), "outputs.txt");     

   
    terminate("Standard deviation completion time  small enough for reliable estimate");

when edge(request)  then

	curr_time := time - last_time;
	Avg := Avg*(counter/(counter + 1)) + curr_time/(counter + 1);
	y2 := y2*(counter/(counter + 1)) + (curr_time^2)/(counter + 1);
	Var := y2 - (Avg^2);
	
	StdDev := sqrt(Var);
  
  	counter := counter + 1;

end when;




end Monitor1;
*/
