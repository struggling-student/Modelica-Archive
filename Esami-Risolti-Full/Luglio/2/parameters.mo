
record Prm

parameter Integer ID = 1234567;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);

parameter Integer N = 2;   // numero sottosistemi

parameter Integer Q = 3;   // numero sensori

parameter Real T = 10;   // 10 seconds time step

parameter Integer K = 10;   // size of sliding winfow for mobile average

end Prm;

