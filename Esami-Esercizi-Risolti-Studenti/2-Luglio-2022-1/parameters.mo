
record Prm

parameter Integer ID = 1234567;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);

parameter Integer N = 5;   // numero sottosistemi

parameter Integer Q = 3;   // numero sensori

parameter Integer K = 10;

parameter Real T = 10;

end Prm;

