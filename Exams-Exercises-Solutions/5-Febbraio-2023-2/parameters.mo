
record Prm

parameter Integer ID = 9999;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);  

// Aggiungere qui gli altri parametri del vostro modello

parameter Real g = 9.81;  // gravity acceleration in m/s^2

parameter Real T = 0.001;

parameter Real Td = 1;

parameter Real p = -1;

parameter Real k1 = -(p^2);
parameter Real k2 = 2*p;
parameter Integer HORIZON = 1000;


end Prm;

