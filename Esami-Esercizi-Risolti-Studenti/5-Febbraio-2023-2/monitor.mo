
block Monitor

Prm p;  // parameters

InputReal x;   // plant state: 
InputReal r;  //  setpoint scelto dallo user
OutputReal e;  //  plant input: u
OutputReal Avg;
OutputReal StdDev;

Integer counter;
Real y2;  // Second order 
Real Var;
algorithm
	when initial() then
		counter := 0;
		Avg := 0;
		StdDev := 0;
		e := 0;
		y2 := 0;
		Var := 0;
	
	elsewhen (time >= p.HORIZON) then
		Modelica.Utilities.Files.remove("outputs.txt");
			Modelica.Utilities.Streams.print("AvgErr StdDevErr (ID = " + String(p.ID) + ", MyMagicNumber = " + String(p.MyMagicNumber) + ", HORIZON = " + String(p.HORIZON) + ", time = " + String(time) + ")", "outputs.txt");
			
	 Modelica.Utilities.Streams.print(String(Avg) + "  " + String(StdDev), "outputs.txt");     
		   
	terminate("Standard deviation completion time  small enough for reliable estimate");

	elsewhen sample(0, p.T) then
		e := x - r;
		Avg := Avg*(counter/(counter + 1)) + e/(counter + 1);
		y2 := y2*(counter/(counter + 1)) + (e^2)/(counter + 1);
		Var := y2 - (Avg^2);
		
		StdDev := sqrt(Var);
	  
	  	counter := counter + 1;


end when;

end Monitor;

