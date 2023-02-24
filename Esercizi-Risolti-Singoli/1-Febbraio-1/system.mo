model System

 // Qua intanto facciamo il System classico, e poi vediamo come inserire la logica
DTMC mc[K.W];

Monitor m1;

equation

// Imposta i parametri della DTMC
for team in 1:K.W loop
    mc[team].k = team;
    mc[team].waitOthers = have_to_wait(m1.x);
end for;

for team in 1:K.W loop
    connect(m1.x[team], mc[team].i);
end for;
end System;

function have_to_wait
    input Integer mc[K.W];
    output Boolean waitOthers;
algorithm
    waitOthers := false;
    for team in 1:K.W loop
        if mc[team] < K.N then
            waitOthers := true;  // Aspetta se almeno un team non è arrivato a K.N
        end if;
    end for;
end have_to_wait;
