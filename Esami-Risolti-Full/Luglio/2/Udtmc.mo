
block Udtmc


OutputReal U;  // output

algorithm


when initial() then
	U := 0;
	
elsewhen sample(0, 5*Prm.T) then

        U := -1 + 2*myrandom();
       
end when;



end Udtmc;

