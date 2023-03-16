
block Plant


InputReal u;
OutputReal C;

Real A;
Real B;



initial equation
    A = 0.0;
    B = 0.0;
    C = 0.0;


equation
    der(A) = -Prm.K1 * A * B + u;
    der(B) = -Prm.K1 * A * B + Prm.K2 * A * C;
    der(C) =  Prm.K1 * A * B - Prm.K2 * A * C;



end Plant;
