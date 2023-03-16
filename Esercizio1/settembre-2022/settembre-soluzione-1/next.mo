
// Questa funzione serve a calcolare a seconda del Team k e della fase di sviluppo corrente i,
// la prossima fase di sviluppo che dovrà essere svolta.
function Next
  input Prm q;
  input Integer k;  // il team di sviluppo
  input Integer i;  // la fase di sviluppo in cui si trova il team k

  output Integer j; // La fase di sviluppo che inizierà a svolgere il team k

  protected
  Real p, y;

  algorithm

    p := myrandom();      // Parto da un valore casuale
    j := 1;               // Fisso la fase j ad 1, ossia quella iniziale
    y := P(q, k, i, j);   // Calcolo la probabilità di far andare il team k dalla fase i alla fase 1

    // Se la probabilità p è maggiore di y, e la fase j in cui transitare NON è quella finale, allora:
    while ((p > y) and (j < q.N)) loop

      j := j + 1;                 // Aumento la fase in cui transitare
      y := y + P(q, k, i, j);     // Calcolo la probabilità di andare da fase i a fase j

    end while;

    // Uscito dal While, viene ritornata la fase j che sarà svolta dal team k

end Next;