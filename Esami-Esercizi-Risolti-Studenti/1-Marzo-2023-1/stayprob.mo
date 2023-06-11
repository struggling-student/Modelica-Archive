function StayProb
    input Real T;       // time step (in days)
    input Real expectedTransitionNumbers;     // Expecter soujourn time in state = θ(i,k)
    output Real p;      // probability of staying in state (Loop Probability) pi,i(kgg)

    algorithm
        
        // θ(i,k) = T/(1 - p)  implica T/θ(i,k) = 1 - p  implica p = 1 -  T/θ(i,k) (procedimento per trovare la formula inversa)
        p := 1 -  T/expectedTransitionNumbers ;

end StayProb;