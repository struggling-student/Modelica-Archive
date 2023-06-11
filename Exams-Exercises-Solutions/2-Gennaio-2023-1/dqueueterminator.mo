
block DBQueueTerminator

    Prm p;

    // s2c
    // client input queue (ciq) con la quali il client riceve dati dal server
    OutputBoolean readsignal;
    InputReal outputdata[3];        // Prende in input dal Server la coppia (timestamp, value) misurato
    InputBoolean datavailable;

    Integer state;          // Lo stato corrente del CLient
    //Integer sensor_index;   // Il sensore corrente che si sta analizzando
    Integer fifox;          // Lo stato della comunicazione I/O


    algorithm

        when initial() then

            state := 0;
            readsignal := false;        // Non sta leggendo
            fifox := InitFifoIOState(); // L'I/O sta iniziando

        elsewhen sample(0, p.T)  then

            // Si vuole leggere la fifo
            if (state == 0) then
            // Si prova a leggere dalla Fifo
            (readsignal, fifox) := ReadFromFIFO(pre(fifox), pre(datavailable), pre(readsignal));

                // Se la lettura è terminata, il valore è disponibile
                if (FifoIODone(fifox)) then

                    // ho svuotato la fifo, non devo fare altro

                    state := 0;
                    fifox := InitFifoIOState();
                end if;

            // Altrimenti, continuo l'attesa che terminano le Read/Write
            else
                state := pre(state);   // loop

            end if;

        end when;

end DBQueueTerminator;

