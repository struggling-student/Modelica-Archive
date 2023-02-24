block DTMC

OutputInteger i;  // state of DTMC

InputInteger k;

//? Qua mi può servire qualcosa che mi dica "fermati, che gli altri stanno finendo"
InputBoolean waitOthers;

Integer j;
Real p, y;

algorithm

when initial() then
    i := 1; // Stato iniziale

    p := 0;
    j := 0;
    y := 0;
elsewhen sample(0, K.T) then
    if pre(i) == K.N and pre(waitOthers) then
        i := K.N;
    else

        p := myrandom();      // Parto da un valore casuale
        j := 1;               // Fisso la fase j ad 1, ossia quella iniziale
        y := Prob(i, j, k);   // Calcolo la probabilità di far andare il team k dalla fase i alla fase 1

        // Se la probabilità p è maggiore di y, e la fase j in cui transitare NON è quella finale, allora:
        while ((p > y) and (j < K.N)) loop

        j := j + 1;                 // Aumento la fase in cui transitare
        y := y + Prob(i, j, k);     // Calcolo la probabilità di andare da fase i a fase j

        end while;

        // Aggiorna lo stato attuale
        i := j;

    end if;

end when;


end DTMC;

