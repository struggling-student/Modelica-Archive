
function tau
input Prm q;
input Integer i;
input Integer k;
output Real result;

algorithm

result := A(q, k)*exp(-(i - 1)*lambda(q, k));


end tau;