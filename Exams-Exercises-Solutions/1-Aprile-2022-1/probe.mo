
block Probe

Prm p;

// inputs are all outputs of your blocks

InputInteger x[p.W];  // state of development cycle from DTMC

InputReal y[p.W];  // y[i]: Expected value for development completion time for team 

InputReal z[p.W];  // z[i]: Expected value for development cost for team i


OutputBoolean probe_output;



equation

probe_output = false;



end Probe;

