
function lambda
input Prm q;
input Integer i;
output Real result;

algorithm

result := exp(-(i - 1)/q.N-1);


end lambda;