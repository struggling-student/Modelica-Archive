
function LoopProb
input Real T;  // time step (in days)
input Integer i;  // phase
input Integer k;  // team
output Real p;   // probability of staying in state (Loop Probability)

algorithm

// sjt = T/(1 - p)  thus T/sjt = 1 - p  thus p = 1 -  T/sjt

p := 1.0 -  T/PhaseDuration(T, i, k) ;

end LoopProb;