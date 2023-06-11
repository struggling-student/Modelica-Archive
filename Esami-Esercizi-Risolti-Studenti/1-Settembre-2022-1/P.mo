
// Questa funzione si occupa di modellare le probabilità della Marckov Chain.
// Le formule che le definiscono sono quelle indicate nelle specifiche
function P
       input Prm q;
       input Integer k;     // il team
       input Integer i;     // lo present state
       input Integer j;     // il next state

       output Real p;       // la probabilità

       algorithm

              // Se i == j la probabilità è la probabilità di rimanere nello stesso stato
              if (i == j)
                     then  p := LoopProb(q.T, tau(q, i, k));

              // Come definito sulla specifica
              elseif (i == 1) and (j == 2)
                     then p := 1 - LoopProb(q.T, tau(q, i, k));

              // Come definito sulla specifica
              elseif (2 <= i) and (i <= q.N-1) and (j == i + 1)
                     then p := (1 - alpha(k, q))*(1 - LoopProb(q.T, tau(q, i, k)));

              // Come definito sulla specifica
              elseif (2 <= i) and (i <= q.N-1) and (1 <= j) and (j < i)
                     then  p := alpha(k, q)*(1 - LoopProb(q.T, tau(q, i, k)))/(i - 1);

              // Se è arrivata alla fase di delivery, allora la probabilità di cambiare stato è 1
              elseif (i == q.N) and (j == 1)
                     then p := 1;

              // Altrimenti, in tutti gli altri casi, la probabilità è 0
              else 
                     p := 0;
              end if;

end P;