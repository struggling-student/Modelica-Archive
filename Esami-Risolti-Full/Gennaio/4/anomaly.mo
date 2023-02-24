
block AnomalyDetection

Prm p;

InputReal MobAvg[p.N];   //  MobAvg[i]: expected value sensor i

OutputBoolean Yad[p.N];  //  anomaly dected on senso i

Real reference[p.N];

equation


for i in 1:p.N loop

reference[i] = (LowerBound(i) + UpperBound(i))/2;

Yad[i] = if ((MobAvg[i] < 0.8*reference[i]) or (MobAvg[i] > 1.2*reference[i]))
	   then
	      true
	   else
	      false;
end for;

end AnomalyDetection;

