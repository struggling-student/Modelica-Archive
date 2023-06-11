
block Env

OutputInteger u[2]; 


algorithm

when initial() then

u := {0, 0};

elsewhen sample(0, K.T) then

if (myrandom() <= LoopProb(K.T, K.Tau))
then
   u := {0, 0};
else

   u[1] :=  min(K.N, 1 + integer(floor(myrandom()*K.N)) );
   u[2] :=  min(K.F, 1 + integer(floor(myrandom()*K.F)) );

end if;


end when;

end Env;

