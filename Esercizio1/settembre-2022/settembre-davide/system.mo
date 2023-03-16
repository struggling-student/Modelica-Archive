model System

//* Inizializzo la DTMC con parametro (K.W) 
//* K.W => numero di development teams in azienda
DTMC mc[K.W];

//* Inizializzo il monitor 
Monitor m1;

equation

//* Imposta i parametri della DTMC
for team in 1:K.W loop
    mc[team].k = team;
    mc[team].waitOthers = have_to_wait(m1.x);
end for;

for team in 1:K.W loop
    connect(m1.x[team], mc[team].i);
end for;
end System;

//* Funzione have to wait
function have_to_wait
    input Integer mc[K.W];
    output Boolean waitOthers;
//* Aspetta se almeno un team non è arrivato a K.N    
algorithm
    waitOthers := false;
    for team in 1:K.W loop
        if mc[team] < K.N then
            waitOthers := true;  
        end if;
    end for;
end have_to_wait;