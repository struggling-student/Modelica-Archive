
block Plant


OutputReal x;   // plant state: 
InputReal u;  //  plant input: u
InputReal d;
initial equation
x = 0;

equation


der(x) = Prm.a * min(1,max(0,u)) -Prm.b - d ;




end Plant;



