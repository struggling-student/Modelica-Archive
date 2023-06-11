
function Next
input Real T;  // time step
input Integer i;   // present state
output Integer j;  //  next state 

protected
Real p, y;

algorithm

p := myrandom();
j := 1;
y := P(T, i, j);

while ((p > y) and (j < K.N)) loop
  j := j + 1;
  y := y + P(T, i, j);
end while;

end Next;