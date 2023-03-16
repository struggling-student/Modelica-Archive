
block DTMC

InputInteger team;   // team

OutputInteger x;  // state of development cycle 

parameter Real T = 1;

// Prm p;   // parametri


algorithm


when initial() then
	x := 1;
	
elsewhen sample(0,T) then

        x := Next(T, team, pre(x));
       
end when;



end DTMC;

