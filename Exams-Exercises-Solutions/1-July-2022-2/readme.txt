sviluppo di un processo software

ciclo di sviluppo: N fasi
la fase N indica che si comincia un nuovo progetto
abbiamo W teams di sviluppo

tempo atteso(in giorni) tau(i,k) per il completamento della fase i da parte del team k è
tau(i,k) = 10 se A(i,k) è True, 50 altrimenti
A(i,k) = True se i % W+1 = k), False altrimenti

MOdellare una cdm con N stati

p_i,i+1(k) probabilità del team k di andare dalla fase i alla fase i+1
la fase N ha probabilità 1 di andare alla fase 1 del progetto successivo 
p_n,1(k) = 1 per ogni k

p_i_i(k) -> prob di rimanere nello stato i
 numero atteso di transizioni prima di lasciare i è:
theta(i,k) = 1 / 1- p_i,i(k)

p_i,i = 
Tempo atteso di soggiorno nello stato i(tempo atteso di completamento della fase i) è tau(i,k) = T * theta(i,k)

Assumiamo T = 1(un giorno)

con questi dati mi calcolo p_i,i(k)


per le altre probabilità vedere il pdf

costo giornaliero = vedere pdf

tempo necessario per completare un progetto = tempo necessario per arrivare alla fase N(tempo completamento)

costo per completare il progetto = tempo completamento * moltiplicato per costo giornaliero

calcolare il tempo e il costo atteso di completamento di un progetto


costo atteso = tempo atteso*costo giornaliero



P.mo è la funzione di transizione, dato T,il team,stato corrente e futuro indica la probabilità di andare dallo stato corrente a quello futuro
LoopProb è la funzione che calcola la probabilità di self loop(probabilità di rimanere nello stesso stato)
LoopProb = 1 - T / theta(i,k,T)

tempo di soggiorno(numero atteso di transizioni prima di lasciare lo stato i)= 
theta =   T / 1-p (si assume T = 1) con p = probabilità di selfloop nello stato i

tau = tempo atteso per il completamento della fase i,siccome T = 1, allora il tempo atteso = numero atteso di transizioni = theta

theta = a 10 se A(i,k) == 1,50 altrimenti


dtcm.mo ho un team in input e l'output è lo stato
ad ogni T vado allo step successivo con Next
next.mo -> i è il present state,restituisce lo stato futuro chiamando P(probabilità di andare da i a j)

complemention-time (prende lo stato e ritorna valore atteso del tempo completamento e deviaizone standard)
tempo atteso = 

monitor -> calcola valore atteso del tempo di completamento e del costo di completamento
e deviazione standard del tempo e del costo di completamento
prende in input-> valori attesi dei tempi di completamento e e delle deviazioni standard
in output da i costi medi e costo della deviazione standard

poi scrive su file output
termina quando il max della deviazione standard è < 130 e time > 40000 or time >= 1000000 termino
