
function Next
input Real T;  // time step
input Integer k;   // team
input Integer i;   // present state
output Integer j;  //  next state 

protected
Real p, y;

algorithm

p := myrandom();
j := 1;
y := P(T, k, i, j);

while ((p > y) and (j < Prm.N)) loop
  j := j + 1;
  y := y + P(T, k, i, j);
end while;

end Next;