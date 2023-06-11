model System


Env env[Prm.N, Prm.Q];

Monitor m1[Prm.N, Prm.Q];

Terminator term;

equation


for i in 1:Prm.N loop
    for j in 1:Prm.Q loop
        env[i, j].X0 = Prm.Q*(i - 1) + j;
    end for;
end for;




for i in 1:Prm.N loop
    for j in 1:Prm.Q loop
        connect(env[i, j].Xval, m1[i, j].x);
        connect(m1[i, j].y, term.y[i, j]);
    end for;
end for;





end System;
