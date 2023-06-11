
record Prm

parameter Integer ID = 9999;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);  

parameter Integer N = 10;  // numero di fasi del ciclo di sviluppo

parameter Integer W = 5;  // numero di development teams in azienda

parameter Real T = 1;

end Prm;

