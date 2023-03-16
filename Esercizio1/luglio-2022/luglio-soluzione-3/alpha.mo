
function alpha

input Integer k;
input Prm q;
output Real result;

algorithm

result := 1/(q.F*(q.G*q.W - k));


end alpha;