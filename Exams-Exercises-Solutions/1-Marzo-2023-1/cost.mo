
function Cost           
    input Integer k;       
    output Real cost;     

    algorithm

     cost := 1000-500*((k-1)/Prm.W-1);


end Cost;