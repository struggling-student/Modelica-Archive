function costPerDay
    input Integer k; // Team
    output Real c; // Costo
algorithm
    c := 1000 - 500*((k-1)/(K.W-1));
end costPerDay;