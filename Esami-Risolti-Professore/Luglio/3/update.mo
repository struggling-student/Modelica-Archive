
function update
input Integer i;
input Integer j;
output Integer i1;
output Integer j1;


algorithm

if (j < Prm.Q) then
   i1 := i;
   j1 := j + 1;
elseif  (i < Prm.N) then
   i1 := i + 1;
   j1 := 1;
else // (i >= Prm.N)  and (j >= Prm.Q)
   i1 := 1;
   j1 := 1;
end if;

end update;