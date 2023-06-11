function A

input Prm p; // parameters
input Integer i; // phase
input Integer k; // team
output Boolean result;

algorithm

if (mod(i, p.W) + 1 == k) then

result := true;

else 

result := false;

end if;


end A;