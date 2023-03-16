model System

Prm p;

Env env;

Monitor m1;
//ClientMockup mkup;


equation


// connect models to form system
for i in 1:p.N loop
  for j in 1:p.Q loop
   connect(m1.X[i,j], env.X[i,j]);
  end for;
end for;

end System;
