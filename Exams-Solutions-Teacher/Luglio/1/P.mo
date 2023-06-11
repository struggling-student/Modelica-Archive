
function P
input Real T;  // time step
input Integer k;  //  team
input Integer i;   // present state
input Integer j;  //  next state 
output Real p;

algorithm

if (i == j)
       then  p := LoopProb(T, i, k);

elseif (i == 1) and (j == 2)
       then p := 1 - LoopProb(T, i, k);

elseif (2 <= i) and (i < Prm.N) and (j == i + 1)
       then p := (1 - Alpha(k))*(1 - LoopProb(T, i, k));

elseif (2 <= i) and (i < Prm.N) and (1 <= j) and (j < i)
       then  p := Alpha(k)*(1 - LoopProb(T, i, k))/(i - 1);

elseif (i == Prm.N) and (j == 1)
       then p := 1;

else p := 0;

end if;

end P;


function Alpha
input Integer k;  //  team
output Real y;

algorithm

y := 1.0/(5 + k);

end Alpha;