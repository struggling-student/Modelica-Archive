
block Plant

InputReal u;
InputReal d;
OutputReal x;   // plant state: 


Integer a, b;
algorithm

when initial() then
a := 10;
b := 1;
end when;

equation

der(x) = a*min(1, max(0, u)) - b - d;

end Plant;

