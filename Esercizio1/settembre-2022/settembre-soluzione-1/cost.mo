
function Cost
    input Prm q;
    input Integer k;        // Il team di cui calcoliamo il costo
    output Real result;     // Il costo del team k

    algorithm

        // Formula indicata sulle specifiche
        result := 1000 - 500*((k -1)/(q.W - 1));


end Cost;