

record Prm

parameter Integer ID = 1948810;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);  

// Aggiungere qui gli altri parametri del vostro modello

parameter Real T = 0.001;
parameter Real Td = 1;
parameter Real p = -1;
parameter Real k1 = -(p^2);
parameter Real k2 = 2*p;
parameter Real HORIZON = 1000;

parameter Real a = 10;

parameter Real b = 1;

end Prm;

