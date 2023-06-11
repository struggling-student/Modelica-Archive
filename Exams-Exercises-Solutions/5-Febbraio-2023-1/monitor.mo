
block Monitor

Prm p;  // parameters

InputReal x;   // plant state: 
InputReal r;  //  setpoint scelto dallo user
InputReal u;  //  plant input: u


OutputReal e;    // e[i]: errore su componente i

//Per valore atteso e StdDev
OutputReal y;  // valore atteso errore
OutputReal z;  // StdDev (deviazione standard) dell'errore

Integer counter;  
Real y2;  // Second order moment for development errore
Real Var;  // Variance errore

  	



algorithm
when initial() then
	counter := 0;
  	y := 0;
  	y2 :=0;
  	z := 0;
	Var := 0;
	
elsewhen sample(0,Prm.T)  then
	e := (x-r);
		
		//praticamente un copia e incolla di completion-time di luglio
		y := y*(counter/(counter + 1)) + e/(counter + 1) ;
		y2 := y2*(counter/(counter + 1)) + (e^2)/(counter + 1) ;
		Var := y2 - (y^2);
      		z := sqrt(Var);
	counter := counter + 1;
end when;
 
// terminator
// adjust as needed 

when (time > p.HORIZON) then

    Modelica.Utilities.Files.remove("outputs.txt");
    
    Modelica.Utilities.Streams.print("AvgErr StdDevErr (ID = "+String(p.ID)+", MyMagicNumber = "+String(Prm.MyMagicNumber)+", HORIZON = "+String(p.HORIZON)+", time = "+String(time)+")", "outputs.txt");
    
         Modelica.Utilities.Streams.print(String(y)+"  "+String(z), "outputs.txt");  
   
    terminate("Standard deviation completion time  small enough for reliable estimate");
end when;

end Monitor;

