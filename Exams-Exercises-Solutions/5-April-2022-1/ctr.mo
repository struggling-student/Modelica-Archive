
block Controller

InputReal C;
InputReal v_ref;
OutputReal u;

//var private

Real z;

initial equation
z = 0.0;


algorithm
    when sample(0, Prm.T) then
       z := pre(z) + Prm.T * (v_ref - pre(C));
       //z := 0.5;
       //u := 0.5;
       u := Prm.kp * (v_ref - C) + Prm.ki * z;
    end when;

end Controller;

