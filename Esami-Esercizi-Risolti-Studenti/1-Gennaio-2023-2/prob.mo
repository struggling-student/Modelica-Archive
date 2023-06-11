
// Questa funzione si occupa di modellare le probabilità della Markov Chain.
// Le formule che le definiscono sono quelle indicate nelle specifiche (dati storici)
function Prob
    // todo sostituire con i parametri
       input Integer k;     // il team
       input Integer i;     // il present state
       input Integer j;     // il next state

       output Real p;       // la probabilità calcolata

       algorithm
              
              // pi,i(k)
              // Se i == j la probabilità è la probabilità di rimanere nello stesso stato
              if (i == j)
                     then  p := StayProb(Prm.T, WaitingTime(i, k));

              // p1,2(k)
              // Come definito sulla specifica
              elseif (i == 1) and (j == 2)
                     then p := 1 - StayProb(Prm.T, WaitingTime(i, k));

              // per i = 2,...N-1  pi,i+1(k)
              // Come definito sulla specifica
              elseif (2 <= i) and (i <= Prm.N-1) and (j == i + 1)
                     then p := (1 - alpha(k))*(1 - StayProb(Prm.T, WaitingTime(i, k)));

              // per i = 2,...,N-1, per j = 1,...,i-1  pi,j(k)
              // Come definito sulla specifica
              elseif (2 <= i) and (i <= Prm.N-1) and (1 <= j) and (j < i)
                     then  p := alpha(k)*(1 - StayProb(Prm.T, WaitingTime(i, k)))/(i - 1);
              
              // pN,1(k)
              // Se è arrivata alla fase di delivery, allora la probabilità di cambiare stato è 1
              elseif (i == Prm.N) and (j == 1)
                     then p := 1;

              // Altrimenti, in tutti gli altri casi, la probabilità è 0
              else 
                     p := 0;
              end if;

end Prob;