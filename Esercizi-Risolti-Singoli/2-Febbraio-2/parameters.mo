
record Prm

parameter Integer ID = 1948810;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);  

// Aggiungere qui gli altri eventuali parametri del vostro modello

parameter Real HORIZON = 10000;
parameter Real tau = 2;
parameter Real p = 20;
parameter Real N = 300;
parameter Real F = 10;
parameter Real K = 20;
parameter Real S = 10;
parameter Real Q = 5;


end Prm;

