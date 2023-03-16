
// calcolo del tempo attesto di tau.
function tau
    input Prm q;
    input Integer i;            // Stato corrente
    input Integer k;            // Team corrente

    output Real result;

    algorithm

        
        result := (q.A + q.B * k + q.C * i + q.D *k * i);


    end tau;
