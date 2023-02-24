model System

Prm p;

Sensors s;

Server2Client s2c;
Client2Server c2s;

Env env;

Client client;
Probe prb;

equation


// connect models to form system

connect(s.sensor, env.sensor);


connect(env.inputdata1, s2c.inputdata);
connect(env.writesignal1, s2c.writesignal);
connect(env.spaceavailable1, s2c.spaceavailable);

connect(s2c.readsignal, client.readsignal);
connect(s2c.outputdata, client.outputdata);
connect(s2c.datavailable, client.datavailable);


connect(env.readsignal1, c2s.readsignal);
connect(env.outputdata1, c2s.outputdata);
connect(env.datavailable1, c2s.datavailable);

connect(c2s.writesignal, client.writesignal);
connect(c2s.inputdata, client.inputdata);
connect(c2s.spaceavailable, client.spaceavailable);



// connect output of all models to probe

connect(s.sensor, prb.sensor);


connect(env.inputdata1, prb.env_inputdata1);
connect(env.writesignal1, prb.env_writesignal1);
connect(env.readsignal1, prb.env_readsignal1);

connect(c2s.spaceavailable, prb.c2s_spaceavailable);
connect(c2s.datavailable, prb.c2s_datavailable);
connect(c2s.outputdata, prb.c2s_outputdata);

connect(s2c.spaceavailable, prb.s2c_spaceavailable);
connect(s2c.datavailable, prb.s2c_datavailable);
connect(s2c.outputdata, prb.s2c_outputdata);


connect(client.readsignal, prb.client_readsignal);
connect(client.inputdata, prb.client_inputdata);
connect(client.writesignal, prb.client_writesignal);
connect(client.MobAvg, prb.client_MobAvg);


end System;


