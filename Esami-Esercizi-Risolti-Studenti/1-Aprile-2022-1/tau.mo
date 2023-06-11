
function tau
input Prm q;
input Integer i;
input Integer k;
output Real result;

algorithm

result := A(q, k) * lambda(q,i);


end tau;