
block Env

OutputInteger u[3];  // reservation request: u[1] student id, u[2] classroom id, u[3] time slot


algorithm

when initial() then

u := {0, 0, 0};

elsewhen sample(0, K.T) then

if (myrandom() <= LoopProb(K.T, K.Tau))
then
   u := {0, 0, 0};
else

   u[1] :=  min(K.N, 1 + integer(floor(myrandom()*K.N)) );
   u[2] :=  min(K.Q, 1 + integer(floor(myrandom()*K.Q)) );
   u[3] :=  min(K.W, 1 + integer(floor(myrandom()*K.W)) );

end if;


end when;

end Env;

