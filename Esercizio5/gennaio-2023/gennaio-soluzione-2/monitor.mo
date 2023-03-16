block Monitor

// input
InputReal X[3];      // posiidione del drone
InputReal V[3];      // velocità del drone
InputReal U[3];      // controller output (drone acceleration)
InputReal R[3];      // vettor r


OutputReal avg[3];	
OutputReal stdDev[3]; // deviadione standard

OutputReal W[3];   // array con l'errore

Integer counter;

Real y;
Real c;  // Second order moment for development completion time
Real Var;  // Variance completion time
Real d;

Boolean endCondition;



algorithm

when initial() then

counter := 0;
y := 0;
c := 0;
Var := 0;
d := 0;
endCondition := true;

// TODO : controllare se posso rimuovere questa parte e funziona lo stesso.
for i in 1:3 loop
	stdDev[i] := 0;
	avg[i] := 0;
end for;


elsewhen sample(0, Prm.T) then

for i in 1:3 loop

	W[i] := X[i] - R[i];

	y := y*(counter/(counter + 1)) + W[i]/(counter + 1) ;
	// variable utile al calcolo della varianza
	c := c*(counter/(counter + 1)) + (W[i]^2)/(counter + 1) ;

	// varianza
	Var := c - (y^2);
	// calcolo varianza
	d := sqrt(Var);

	counter := counter + 1;
	
	avg[i] := y;
	stdDev[i] := d;

end for;





endCondition := true;


if (time > Prm.HORIZON) then
endCondition := true; // finished
else 
endCondition := false; // we havent reached yet the 40000 mark
end if;


if (endCondition) then

Modelica.Utilities.Files.remove("outputs.txt");
Modelica.Utilities.Streams.print("ComponentIndex AvgError StdDevError (ID = " + String(Prm.ID) + ", MyMagicNumber = " + String(Prm.MyMagicNumber) + ", HORIZON=" + String(Prm.HORIZON) + ", time =" + String(time) + " )", "outputs.txt");

for i in 1:3 loop 
    Modelica.Utilities.Streams.print(String(i) + "  " + String(avg[i]) + "  " + String(stdDev[i]), "outputs.txt");     
end for;

terminate("Standard deviation completion time  small enough for reliable estimate");

end if;
    
end when;




end Monitor;

