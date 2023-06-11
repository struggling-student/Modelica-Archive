function Probii
    input Real T;       
    input Real etn;     
    output Real p;      
    algorithm
        
        // θ(i,k) = T/(1 - p)  implica T/θ(i,k) = 1 - p  implica p = 1 -  T/θ(i,k) (procedimento per trovare la formula inversa)
        p := 1 -  T/etn ;

end Probii;