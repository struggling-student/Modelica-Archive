
block Client

parameter Integer ClientName = 1;   // 1 se accetta pazienti dispari, 2 se accetta pazienti pari

parameter Real Tclient = K.T/2;

InputInteger u[3];   // input dall'environment, reservation request

// client input queue (ciq) con la quali il client riceve dati dal server
OutputBoolean readsignal;
InputInteger outputdata[1];  // 1 se insertion ok, 2 se fail
InputBoolean datavailable;  

// server input queue (siq) con la quale il client manda dati al server
OutputInteger inputdata[3];   // richiesta di prenotazione inviata al server
OutputBoolean writesignal;
InputBoolean spaceavailable;

Integer state, ValueFromServer;


algorithm


when initial() then

writesignal := false;
readsignal := false;
state := 0;
inputdata := {0, 0, 0};
ValueFromServer := 0;

elsewhen sample(0, Tclient) then

if (state == 0)
    and
    not((u[1] == 0) and (u[2] == 0) and (u[3] == 0))   // input is not nop
    and
   (
      ((mod(u[1], 2) == 1) and (ClientName == 1))    // students with odd id
     or
      ((mod(u[1], 2) == 0) and (ClientName == 2))   // students with even id
   )

then  // read env
   inputdata := u;
   state := 10;  

elseif (state == 10 ) and pre(spaceavailable)
then  // send data to server 
    writesignal := not(pre(writesignal));
    state := 20;

elseif (state == 20) and pre(datavailable)
then // ask msg from server

     readsignal := not(pre(readsignal));
     state := 30;

elseif (state == 30)
then // read msg from server

   ValueFromServer := pre(outputdata[1]);
   state := 0;  // loop
   
   // ValueFromServer actually not used by client, since no client behaviour is specified
   
else
     state := pre(state);
     
end if;



end when;





end Client;

