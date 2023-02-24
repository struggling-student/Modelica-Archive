model System

// sequential checker


Env env[Prm.N, Prm.Q];

StreamMobAvg m1[Prm.N, Prm.Q];

Client  c1[Prm.N,Prm.Q];

Real y;    // Anomaly Detection Signal, computed sequentially

Real ypy[Prm.N, Prm.Q];   //  Anomaly Detection Signal, parallele computation

Terminator term;

Integer i, j;

equation


for i in 1:Prm.N loop
    for j in 1:Prm.Q loop
      connect(env[i, j].writesignal, c1[i, j].writesignal);
      connect(env[i, j].inputdata, c1[i, j].inputdata);
      connect(env[i, j].spaceavailable, c1[i, j].spaceavailable);
    end for;
end for;


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

// parallel computation of anomaly detection signal

for i in 1:Prm.N loop
    for j in 1:Prm.Q loop
        ypy[i, j] = AnomalyDetection(c1[i,j].ValueFromServer, c1[i,j].Mavg.y);
   end for;
end for;



// sequential version (as from text of exercise)

algorithm

when initial() then
i := 1;
j := 1;

       y := 0;
	  
elsewhen sample(0, 1.0) then

   y := AnomalyDetection(c1[pre(i),pre(j)].ValueFromServer, c1[pre(i),pre(j)].Mavg.y);

   (i, j) := update(pre(i), pre(j));

end when;



end System;



