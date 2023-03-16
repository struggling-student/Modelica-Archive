
function LoopProb

input Real T;  // time step (in days)
input Real sjt;  // Expecter soujourn time in state
output Real p;   // probability of staying in state (Loop Probability)

algorithm

// sjt = T/(1 - p)  thus T/sjt = 1 - p  thus p = 1 -  T/sjt

p := 1 -  T/sjt ;

end LoopProb;