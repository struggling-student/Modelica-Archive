
// Modella la catena di Marckov

// La particolarità di questo esericizio è che abbiamo W team di sviluppo,
// pertanto l'esperimento concettuale che facciamo è far svolgere il lavoro a tutti i team,
// in modo tale che poi è possibile scegliere il team migliore

// Abbiamo pertanto, in realtà, modellato W catene di Marckov
block DTMC

      Prm p;   // parameters
      
      InputInteger team;

      OutputInteger x;  // ritorna un vettore di interi di dimensione W

      /*
            x[k] = è la fase di sviluppo attuale in cui si trova il team k
      */

      algorithm

            when initial() then

                  x := 1;

            elsewhen sample(0, p.T) then

           	x := Next(p, team, pre(x));
             

            end when;


end DTMC;

