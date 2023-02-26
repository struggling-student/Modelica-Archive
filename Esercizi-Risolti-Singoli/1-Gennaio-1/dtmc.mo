
block DTMC

InputInteger k; // team

OutputInteger x;  // stato del ciclo di sviluppo

parameter Real T = 1;

algorithm
    when initial() then
        x := 1;
    
    elsewhen sample(0, T) then
        x := Next(pre(x), k);
    
    end when;

end DTMC;
