
block Probe

// inputs are all outputs of your blocks

InputReal u[2]; // from ctr
InputReal x[2];  // from plant
InputReal Zref[2];  // from user
InputReal Ym1[2];  // from monitor



OutputBoolean probe_output;



equation

probe_output = false;



end Probe;

