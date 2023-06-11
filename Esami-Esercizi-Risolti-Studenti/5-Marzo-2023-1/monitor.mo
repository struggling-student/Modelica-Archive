block Monitor

InputReal z;
InputReal r;

OutputReal e[2];
OutputBoolean clk;

algorithm
    when sample(0, K.T) then
        clk := not(pre(clk)); // clock per il blocco YDev che calcola valore atteso e deviazione standard nonappena l'errore viene ricalcolato

        e[1] := z;
        e[2] := r;
    end when;

end Monitor;

