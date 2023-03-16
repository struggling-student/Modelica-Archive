function Prob
    input Integer i; // Dallo stato
    input Integer j; // Allo stato
    input Integer k; // Per il team k-esimo
    output Real p; // Probabilità di transizione
algorithm
    //* Formula principale
    if i == j then
        // sjt = T/(1 - p)  implica T/sjt = 1 - p  implica p = 1 -  T/sjt
        p := 1 -  K.T/tau(i, k);
    //* Caso base
    elseif i == K.N and j == 1 then
        p := 1;
    //* Punto 1.
    elseif i == 1 and j == 2 then
        p := 1 - Prob(1,1,k);
    //* Punto 2.
    elseif i >= 2 and i <= K.N - 1 and j == i + 1 then
        p := (1 - alpha(k))*(1-Prob(i,i,k));
    //* Punto 3.
    elseif i >= 2 and i <= K.N - 1 and j >= 1 and j <= i-1 then
        p := alpha(k) * ( (1-Prob(i,i,k)) / (i-1) );
    //* Punto 4.
    else
        p := 0;
    end if;
end Prob;

//* Punto 4.
function alpha
    input Integer k;
    output Real A;
algorithm
    A := 1/(K.F * (K.G * K.W - k));
end alpha;
//* Punto 1. Tempo atteso
function tau
    input Integer i; // Stato DTMC
    input Integer k; // Team
    output Real sojournTime; // Tempo di soggiorno atteso
algorithm
    sojournTime := ( K.A + K.B * k ) /  (K.C + K.D * i);
end tau;