
function Cost
input Real k;  // Team
output Real y;   // Duration phase i when carried out by team k

algorithm


y := 500 + 1000*(k - 1)/(Prm.W - 1) ;


end Cost;

