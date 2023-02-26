// τ(i,k): Funzione per calcolare il Tempo atteso di soggiorno del team k
// nella fase di sviluppo i-esima.
function WaitingTime
    input Integer i;            // Stato corrente
    input Integer k;            // Team corrente

    output Real waitingT;

    algorithm

        // Formula sulla specifica
        waitingT := Prm.A + (Prm.B*k*k) + (Prm.C*i*i) + (Prm.D*k*i);


end WaitingTime;
