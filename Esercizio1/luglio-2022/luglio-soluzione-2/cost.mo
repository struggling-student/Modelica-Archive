
function Cost
input Prm q;
input Integer k;
output Real result;

algorithm

result := 500 + 1000*((k -1)/(q.W - 1));


end Cost ;