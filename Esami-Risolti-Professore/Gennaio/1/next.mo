
function Next
input Prm q;
input Integer k;  // team
input Integer i;   // present state
output Integer j;  //  next state 

protected
Real p, y;

algorithm

p := myrandom();
j := 1;
y := P(q, k, i, j);

while ((p > y) and (j < q.N)) loop
  j := j + 1;
  y := y + P(q, k, i, j);
end while;

end Next;