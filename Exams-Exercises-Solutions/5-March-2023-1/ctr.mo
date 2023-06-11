
block Controller

InputReal z;

OutputReal u;

algorithm
    when initial() then
        u := 1;
    
    elsewhen sample(0, K.T) then
        if pre(z) > 0 then
            u := pre(u) * 1.1;
        else
            u := pre(u) - (pre(u) * 0.1);
        end if;
    end when;

end Controller;

