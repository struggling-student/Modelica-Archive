
function Average
input Prm p;
input Real x[: , :];
input Integer i;
output Real result;

algorithm

result := 0;

for k in 1:p.W loop
    result := result*((k - 1)/k) + (x[i, k]/k);
end for;

    
end Average;

