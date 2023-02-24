block Env
    OutputBoolean writesignal;
    OutputInteger writefifodata[2];
    InputBoolean spaceavailable;

    OutputInteger request[2];

    Integer state;
algorithm

when initial() then
    state := 0;

    request[1] := 0;
    request[2] := 0;

        writesignal := false;
        writefifodata[1] := 0;
        writefifodata[2] := 0;
elsewhen sample(0, 1) then
    if pre(state) == 0 then
        
        if myrandom() <= 1/Prm.tau then

            // Crea dati
            request[1] := integer(floor(myrandom() * Prm.N)) + 1;
            request[2] := integer(floor(myrandom() * Prm.F)) + 1;

            writefifodata[1] := request[1];
            writefifodata[2] := request[2];

            state := 1;
        else
            // Nessuna operazione
            request[1] := 0;
            request[2] := 0;
        end if;
    elseif pre(state) == 1 and pre(spaceavailable) then 
        // Invio dati
        writesignal := not(pre(writesignal));
        state := 0;
    end if;
end when;
end Env;