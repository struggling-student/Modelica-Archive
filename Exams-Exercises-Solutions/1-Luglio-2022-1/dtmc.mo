
block DTMC

      Prm p;   // parameters
      
      InputInteger team;

      OutputInteger x;  


      algorithm

            when initial() then

                  x := 1;

            elsewhen sample(0, p.T) then

           	x := Next(p, team, pre(x));
             

            end when;


end DTMC;

