
function LoopProb
input Real T;       // tempo stabilito
input Real sjt;     // Expecter soujourn time in state
output Real p;      // probabilità

algorithm

        
p := 1 -  T/sjt ;

end LoopProb;