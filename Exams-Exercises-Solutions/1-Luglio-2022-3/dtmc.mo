
block DTMC

Prm p;   // parameters

OutputInteger x[p.W];  // state of development cycle


algorithm

when initial() then

for k in 1:p.W loop
	x[k] := 1;
end for;

elsewhen sample(0, p.T) then

for k in 1:p.W loop
      x[k] := Next(p, k, pre(x[k]));
end for;

end when;


end DTMC;