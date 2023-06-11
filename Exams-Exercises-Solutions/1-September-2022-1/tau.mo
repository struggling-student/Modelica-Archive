
// Funzione per calcolare il Tempo atteso di soggiorno del team k
// nella fase di sviluppo i-esima.
function tau
    input Prm q;
    input Integer i;            // Stato corrente
    input Integer k;            // Team corrente

    output Real result;

    algorithm

        // Formula sulla specifica
        result := (q.A + q.B * k) / (q.C + q.D * i);


    end tau;
