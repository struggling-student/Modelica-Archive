
record Prm

parameter Integer ID = 1234567;  //  Sostituire qui la vostra matricola

parameter Integer MyMagicNumber = 1 + mod(ID, 173);

parameter Integer N = 5;   // numero sensori

parameter Integer W = 10;   // lunghezza media mobile

parameter Real Tsensors = 1;   // sampling time in seconds

parameter Real Tenv = 1;   // sampling time in seconds

parameter Real Tclient = 1;   // sampling time in seconds

end Prm;

