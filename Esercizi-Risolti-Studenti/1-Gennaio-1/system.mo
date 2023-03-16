model System

DTMC mc[K.W];

CompletionBlock ct[K.W];

Monitor m;

equation
    for k in 1:K.W loop
        connect(mc[k].x, ct[k].x);
        mc[k].k = k;
        ct[k].k = k;

        connect(m.y[k], ct[k].y);
        connect(m.z[k], ct[k].stdev);
        connect(m.yC[k], ct[k].yC);
        connect(m.zC[k], ct[k].stdevC);
        connect(m.termcond[k], ct[k].termcond);
    end for;

end System;
