
block Plant


OutputReal x[3];   // plant state: 
InputReal u;  //  plant input: u

initial equation
x[1] = 1;
x[2] = 1;
x[3] = 1;

equation


der(x[1]) = -u*Prm.K1*x[1]*x[2] ;

der(x[2]) = -u*Prm.K1*x[1]*x[2] + Prm.K2*x[2]*x[3] ;

der(x[3]) = u*Prm.K1*x[1]*x[2] - Prm.K2*x[1]*x[3] ;


end Plant;

