
function LowerBound
input Integer i;
output Real result;

algorithm

result := i - 1;

end LowerBound;


function UpperBound
input Integer i;
output Real result;

algorithm

result := i + 1;

end UpperBound;



function SensorValue
input Integer i;
output Real result;

algorithm

result := LowerBound(i) + (UpperBound(i) - LowerBound(i))*myrandom();

end SensorValue;

