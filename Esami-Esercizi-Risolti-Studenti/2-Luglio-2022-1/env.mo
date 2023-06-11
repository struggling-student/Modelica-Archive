
block Env

Prm p;   // parameters

// // client input queue (ciq) where server sends data to client
// OutputReal inputdata1[1];      // sensor value
// OutputBoolean writesignal1;
// InputBoolean spaceavailable1;


// // server input queue (siq) where server receives commands from client
// OutputBoolean readsignal1;
// InputInteger outputdata1[2];   // pair (c, d)
// InputBoolean datavailable1;  


OutputReal X[p.N, p.Q];
OutputReal U[p.N, p.Q];

algorithm

when initial() then

for i in 1:p.N loop
  for j in 1:p.Q loop
    X[i, j] := alpha(i,j);
    U[i, j] := 0;
  end for;
end for;

elsewhen sample(0, p.T) then


for i in 1:p.N loop
  for j in 1:p.Q loop
    X[i, j] := pre(X[i,j]) + p.T*(-1+2*myrandom()+pre(U[i,j]));
  end for;
end for;

end when;
when sample(0, 5*p.T) then

for i in 1:p.N loop
  for j in 1:p.Q loop
    U[i, j] := myrandom() * 2 - 1;
  end for;
end for;

end when;


end Env;

