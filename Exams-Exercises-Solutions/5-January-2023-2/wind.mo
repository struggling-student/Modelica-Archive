block Wind

OutputReal w1, w2;

algorithm

when initial() then
    w1 := 0;
    w2 := 0;

elsewhen sample(0, Prm.Tw) then

    // genera un numero random tra [-1, 1]
    w1 := myrandom() * 2 - 1;
    w2 := myrandom() * 2 - 1;

end when;

end Wind;
