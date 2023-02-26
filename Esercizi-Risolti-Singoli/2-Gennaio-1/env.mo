
block Env

    Prm p;   // parametri del modello

    // client input queue (ciq). FIFO per trasmissione dati
    OutputReal inputdata1[3];
    OutputBoolean writesignal1;
    InputBoolean spaceavailable1;

    OutputBoolean dev_clock; // clock per il delivery (cambia valore quando la scrittura è completata)


    /*
        Stato = 0: producendo il valore
        Stato = 20: Mando il valore prodotto nella Fifo
    */


    Integer state, ValueFromClient, fifox;


    algorithm

        when initial() then

            state := 0;
            writesignal1 := false;
            fifox := InitFifoIOState();     // Inizializzo l'I/O

            inputdata1[1] := 0;
            inputdata1[2] := 0;
            inputdata1[3] := 0;
            ValueFromClient := 0;

            dev_clock := false;

        elsewhen sample(0, p.T)  then

            // Preparo il valore da scrivere nella Fifo
            if  (state == 0) then

                if (myrandom() <= (p.T / 10)) then
                    inputdata1[1] := floor(2000 * myrandom() - 1000); //
                    inputdata1[2] := floor(2000 * myrandom() - 1000); // genero i valori random per la tripla
                    inputdata1[3] := floor(2000 * myrandom() - 1000); //

                    dev_clock := not(pre(dev_clock));     // Inverto il delivery clock per il blocco timediff che calcola intervallo di tempo

                    state := 20;
                end if;

            // Mando il valore al client
            elseif  (state == 20) then

                // Scrivo sulla Fifo
                (writesignal1, fifox) := WriteToFIFO(pre(fifox), pre(writesignal1), pre(spaceavailable1));

                // Se la scrittura è terminata, allora mando il valore
                if (FifoIODone(fifox)) then
                
                    state := 0;
                    fifox := InitFifoIOState();
                end if;

            // Altrimenti si rimane nello stato corrente
            // fin quando non verranno completate le operazioni nella fifo




            else
                state := pre(state);
            end if;
        end when;
end Env;