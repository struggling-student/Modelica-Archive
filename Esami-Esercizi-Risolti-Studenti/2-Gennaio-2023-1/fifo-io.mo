function InitFifoIOState
      output Integer x;

      algorithm
            x := 0;

end InitFifoIOState;


// Funzione che indica se è terminata l'operazione sulla FIFO
function FifoIODone
      input Integer x;              
      output Boolean done;

      algorithm

            // Operazione terminata, restituisco true
            if (x == 2) then
                  done := true;
            
            // Altrimenti false siccome non è terminata
            else
                  done := false;
            end if;

end FifoIODone;


// Funzione per leggere dati dalla Fifo
function ReadFromFIFO
      input Integer x;                    // stato della fifo
      input Boolean datavailable;         // true se ci sono dati da leggere
      input Boolean readsignal;           // viene invertito il valore dopo la lettura

      output Boolean new_readsignal;      // il valore che viene invertito (vedi commento sopra)
      output Integer new_x;               // nuovo stato della fifo

      algorithm

            new_readsignal := readsignal;
            
            // leggo se ci sono dati da leggere
            if (x == 0) and datavailable  then

                  new_readsignal := not(readsignal);
                  new_x := 1;
            
            // leggo dalla fifo
            elseif  (x == 1) then
                  new_x := 2;  // lettura terminata
            
            else  // lettura non terminata
                  new_x := x;
                  
            end if;

end ReadFromFIFO;


// Funzione per scrivere dati nella FIFO
function WriteToFIFO
      input Integer x;                    // stato della fifo
      input Boolean writesignal;
      input Boolean spaceavailable;

      output Boolean new_writesignal;
      output Integer new_x;               // nuovo stato della fifo

      algorithm

            new_writesignal := writesignal;

            // aggiorna lo stato
            if (x == 0) then
                  new_x := 1;

            // scrive se spazio libero sufficiente nella FIFO per una nuova scrittura
            elseif (x == 1) and spaceavailable then

                  new_writesignal:= not(writesignal);
                  new_x := 2;
                        
            else  // spazio non sufficiente, si deve attendere
                  new_x := x;
                  
            end if;

end WriteToFIFO;