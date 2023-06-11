block Monitor

InputReal x[3];
InputReal r[3];

OutputReal e[3];
OutputBoolean clk;

algorithm
    when sample(0, K.T) then
        clk := not(pre(clk)); // clock per il blocco YDev che calcola valore atteso e deviazione standard nonappena l'errore viene ricalcolato

        e := x - r; // errore
    end when;

end Monitor;

