
block Sensors

Prm p;   // parameters

OutputReal sensor[p.N];

algorithm

when initial() then

for i in 1:p.N loop
   sensor[i] := 0;
end for;

elsewhen sample(0, p.Tsensors) then

for i in 1:p.N loop
   sensor[i] := SensorValue(i);
end for;

end when;


end Sensors;

