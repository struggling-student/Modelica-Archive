
record Prm

parameter Integer ID = 1234567;  //  Sostituire qui la vostra matricola

parameter Integer MyMagiNumber = 1 + mod(ID, 173);

parameter Real T = 0.001;

parameter Real Kp = 0.1;

parameter Real Ki = 0.1;

end Prm;

