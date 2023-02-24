
block Env

OutputInteger u[2]; 


algorithm

when initial() then

u := {0, 0};

elsewhen sample(0, Prm.T) then

if (myrandom() <= LoopProb(Prm.T, Prm.Tau))
then
   u := {0, 0};
else

   u[1] :=  min(Prm.N, 1 + integer(floor(myrandom()*Prm.N)) );
   u[2] :=  min(Prm.F, 1 + integer(floor(myrandom()*Prm.F)) );

end if;


end when;

end Env;

