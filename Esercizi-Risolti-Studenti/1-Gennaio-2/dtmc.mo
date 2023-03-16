
// Modella la catena di Marckov di un team
block DTMC
      
      InputInteger team; // team interessato 

      OutputInteger x;  // stato in cui si trova il team

      algorithm

            when initial() then

                  x := 1;

            elsewhen sample(0, Prm.T) then

           	x := Next(team, pre(x));
             

            end when;


end DTMC;

