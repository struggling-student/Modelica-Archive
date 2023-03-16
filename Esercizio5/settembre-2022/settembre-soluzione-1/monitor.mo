
block Monitor

// input
InputReal X[3];      // drone position
InputReal V[3];      // drone velocity
InputReal U[3];      // controller output (drone acceleration)
InputReal R[3];      // reference from user

/*
InputReal z[3];
InputReal y[3];

*/

OutputReal avg[3];
OutputReal stdDev[3];


// output
OutputReal W[3];   // errore

Integer counter;
Real y;
Real y2;  // Second order moment for development completion time
Real Var;  // Variance completion time
Real z;
Boolean endCondition;



algorithm

when initial() then

counter := 0;
y := 0;
y2 := 0;
Var := 0;
z := 0;
endCondition := true;

for i in 1:3 loop
	stdDev[i] := 0;
	avg[i] := 0;
end for;


elsewhen sample(0, K.T) then

for i in 1:3 loop

W[i] := X[i] - R[i];


//calculate 

	y := y*(counter/(counter + 1)) + W[i]/(counter + 1) ;
      // variable utile al calcolo della varianza
    	y2 := y2*(counter/(counter + 1)) + (W[i]^2)/(counter + 1) ;

      // varianza
     	 Var := y2 - (y^2);
      // std dev
      	z := sqrt(Var);
      
      counter := counter + 1;
      
      avg[i] := y;
      stdDev[i] := z;
      
      


end for;

endCondition := true;

    if (time > 200) then
        endCondition := true; // finished

    elseif (time > 50) then // check if end condition is met
        for w in 1:3 loop
            if ((avg[w] * stdDev[w]) > 0.1) then
                endCondition := false;
                break;
            end if;
        end for;

    else 
        endCondition := false; // we havent reached yet the 40000 mark
    end if;


    if (endCondition) then

        Modelica.Utilities.Files.remove("outputs.txt");
        Modelica.Utilities.Streams.print("p k1 k2 Component AvgValue StdDeValue (ID = " + String(Prm.ID) + ", MyMagicNumber = " + String(Prm.MyMagicNumber) + ", time = " + String(time) + " )", "outputs.txt");
    
        for i in 1:3 loop 
            Modelica.Utilities.Streams.print(String(K.p) + "  " + String(K.k1) + "  " +  String(K.k2) + "  " + String(i) + "  " + String(avg[i]) + "  " + String(stdDev[i]), "outputs.txt");     
        end for;

        terminate("Standard deviation completion time  small enough for reliable estimate");
    
    end if;
    
end when;




end Monitor;

