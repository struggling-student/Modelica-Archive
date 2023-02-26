model System

Prm p;

DBQueue s2c;

Env env;

DBQueueTerminator mkup;

YDev yval[3];

TimeDiff tdiff;

YDev ydiff;

Monitor1 m;

equation

connect(env.inputdata1, s2c.inputdata);
connect(env.writesignal1, s2c.writesignal);
connect(env.spaceavailable1, s2c.spaceavailable);

connect(s2c.readsignal, mkup.readsignal);
connect(s2c.outputdata, mkup.outputdata);
connect(s2c.datavailable, mkup.datavailable);

connect(yval[1].prm, env.inputdata1[1]);
connect(yval[2].prm, env.inputdata1[2]);
connect(yval[3].prm, env.inputdata1[3]);

connect(yval[1].clk, env.dev_clock);
connect(yval[2].clk, env.dev_clock);
connect(yval[3].clk, env.dev_clock);

connect(tdiff.delivery, env.dev_clock);
connect(ydiff.prm, tdiff.diff);

connect(ydiff.clk, tdiff.clock);

connect(yval[1].y, m.yVal[1]);
connect(yval[2].y, m.yVal[2]);
connect(yval[3].y, m.yVal[3]);

connect(yval[1].stdDev, m.zVal[1]);
connect(yval[2].stdDev, m.zVal[2]);
connect(yval[3].stdDev, m.zVal[3]);

connect(ydiff.y, m.yTime);
connect(ydiff.stdDev, m.zTime);

//connect(env.readsignal1, c2s.readsignal);
//connect(env.outputdata1, c2s.outputdata);
//connect(env.datavailable1, c2s.datavailable);
//
//connect(c2s.writesignal, mkup.writesignal);
//connect(c2s.inputdata, mkup.inputdata);
//connect(c2s.spaceavailable, mkup.spaceavailable);



//// connect output of all models to probe
//
//connect(s.sensor, prb.sensor);
//
//
//connect(env.inputdata1, prb.env_inputdata1);
//connect(env.writesignal1, prb.env_writesignal1);
//connect(env.readsignal1, prb.env_readsignal1);
//
//connect(c2s.spaceavailable, prb.c2s_spaceavailable);
//connect(c2s.datavailable, prb.c2s_datavailable);
//connect(c2s.outputdata, prb.c2s_outputdata);
//
//connect(s2c.spaceavailable, prb.s2c_spaceavailable);
//connect(s2c.datavailable, prb.s2c_datavailable);
//connect(s2c.outputdata, prb.s2c_outputdata);
//
//
//connect(mkup.readsignal, prb.mkup_readsignal);
//connect(mkup.inputdata, prb.mkup_inputdata);
//connect(mkup.writesignal, prb.mkup_writesignal);


end System;


