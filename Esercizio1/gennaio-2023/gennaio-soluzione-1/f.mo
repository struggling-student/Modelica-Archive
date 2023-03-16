function Tau
input Integer i; // fase
input Integer k; // team
output Real y; // tempo atteso

algorithm
    y := (K.A + K.B * k^2 + K.C * i^2 + K.D * k * i);
end Tau;

function LoopProb
input Real sjt;  // Tempo di soggiorno atteso
output Real p;   // Probabilità di rimanere nello stesso stato

algorithm
// sjt = T/(1 - p) quindi T/sjt = 1 - p quindi p = 1 -  T/sjt
p := 1 - 1/sjt;

end LoopProb;

function LoopTau
input Integer i; // fase
input Integer k; // team
output Real p; // probabilità di stare nello stesso stato

algorithm
    p := LoopProb(Tau(i, k));
end LoopTau;


function P
input Integer i;
input Integer j;
input Integer k;
output Real p;

algorithm
    if i == j then p := LoopTau(i, k);
    elseif (i == K.N) and (j == 1) then p := 1;
    elseif (i == K.N) and (j > 1) then p := 0;
    elseif (i == 1) and (j == 2) then p := 1 - LoopTau(1, k);
    elseif (i >= 2) and (j == i + 1) then p := (1 - Alpha(k)) * (1 - LoopTau(i, k));
    elseif (i >= 2) and (j >= 1) and (j <= i - 1) then p := Alpha(k) * ((1 - LoopTau(i, k)) / (i - 1));
    else p := 0;
    end if;
end P;

function Alpha
input Integer k;
output Real a;
algorithm
    a := 1 / (K.F * (K.G * K.W - k));
end Alpha;

function DailyCost
input Integer k;
output Real c;
algorithm
    c := 1000 - 500 * ((k - 1) / (K.W - 1));
end DailyCost;


function Next
input Integer i;   // stato corrente
input Integer k;   // team
output Integer j;  // prossimo stato

protected
Real p, y;

algorithm

    p := myrandom();
    j := 1;
    y := P(i, j, k);

    while ((p > y) and (j < K.N)) loop
      j := j + 1;
      y := y + P(i, j, k);
    end while;
end Next;