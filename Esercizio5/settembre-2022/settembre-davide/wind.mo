block Wind

OutputReal w[2];

algorithm
    when initial() then

        w[1] := 0;
        w[2] := 0;

    elsewhen sample(0, K.Tw) then
        // ogni Tw secodi genera dei valori randomici in [-1,1] per le due componenti della forza vento
        w[1] := (myrandom() * 2) - 1;
        w[2] := (myrandom() * 2) - 1;

    end when;

end Wind;