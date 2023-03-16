block Disturbance

OutputReal w;

    algorithm

    when initial() then
        w := 0;
    elsewhen sample(0, Prm.Td) then
        w := (myrandom() * 2);
    end when;

end Disturbance;