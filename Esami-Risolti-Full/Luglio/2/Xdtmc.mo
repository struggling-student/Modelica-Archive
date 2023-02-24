
block Xdtmc

InputReal X0;   // initial value

InputReal U;   // input

OutputReal X;  // output


algorithm


when initial() then
	X := X0;
	
elsewhen sample(0, Prm.T) then
       
       X := pre(X) + Prm.T*(-1 + 2*myrandom() + pre(U));
       
end when;



end Xdtmc;

