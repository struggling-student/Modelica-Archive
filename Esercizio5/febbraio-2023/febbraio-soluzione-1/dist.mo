block Disturbance 

OutputReal d;


algorithm
when initial() then

 d := 0;

elsewhen sample(0, Prm.Td) then
	d := myrandom() *2 ;

end when;

end Disturbance;
