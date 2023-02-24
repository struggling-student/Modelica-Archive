

function A
input Real i;  // Phase
input Real k;  // Team
output Boolean y;   // selection

algorithm

if (mod(i, Prm.W) + 1 == k)
 then  y := true;
 else y := false;
end if ;
  
end A;




function PhaseDuration
input Real T;  // time step (in days)
input Real i;  // Phase
input Real k;  // Team
output Real y;   // Duration phase i when carried out by team k

algorithm

if A(i, k)
  then y := 10;
  else y := 50;
end if;

end PhaseDuration;

