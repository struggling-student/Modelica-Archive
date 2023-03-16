
record Prm

    parameter Integer ID = 1938880;  //  Sostituire qui la vostra matricola

    parameter Integer MyMagicNumber = 1 + mod(ID, 173);

    parameter Real T = 1; // tempo di sample

    parameter Real HORIZON = 10000;

end Prm;

