
function P
input Real T;  // time step
input Integer i;   // present state
input Integer j;  //  next state 
output Real p;

algorithm

if (i == j)
       then  p := LoopProb(T, K.Phase[i]);

elseif (i == 1) and (j == 2)
       then p := 1 - LoopProb(T, K.Phase[i]);

elseif (2 <= i) and (i <= 5) and (j == i + 1)
       then p := (1 - LoopProb(T, K.Phase[i]))/2;

elseif (2 <= i) and (i <= 5) and (1 <= j) and (j < i)
       then  p := (1 - LoopProb(T, K.Phase[i]))/(2*(i - 1));

elseif (i == 6) and (j == 1)
       then p := 1;

else p := 0;

end if;

end P;