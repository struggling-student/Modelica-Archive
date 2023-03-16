
function AnomalyDetection
input Real ValueFromServer;
input Real ValueMobAvg;  
output Real y;  // anomaly signal

algorithm

y := if (ValueFromServer < 0.8*ValueMobAvg)
    then -1 else (if (ValueFromServer > 1.2*ValueMobAvg) then +1 else 0);


end AnomalyDetection;

