
record Prm

parameter Integer ID = 1234567;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);  

// Aggiungere qui gli altri parametri del vostro modello

parameter Real g = 9.81;  // gravity acceleration in m/s^2



end Prm;

