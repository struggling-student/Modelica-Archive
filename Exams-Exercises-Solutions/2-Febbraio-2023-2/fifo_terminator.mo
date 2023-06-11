block FifoTerminator
    InputBoolean datavailable;
    InputInteger readfifodata[2];
    OutputBoolean readsignal;


    Integer state;
    Integer readRequest[2];
algorithm

when initial() then
    readsignal := false;
    state := 0;
    readRequest[1] := 0;
    readRequest[2] := 0;
elsewhen sample(0, 0.1) then
    if pre(state) == 0 and pre(datavailable) then
        readsignal := not(pre(readsignal));
        state := 1;
    elseif pre(state) == 1 then
        for i in 1:2 loop
            readRequest[i] := pre(readfifodata[i]);
        end for;
        state := 0;
    end if;
end when;
end FifoTerminator;