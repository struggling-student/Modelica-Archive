
block Env

InputReal X0;        // initial value
OutputReal Xval;        // X value

// fifos2c

// write side
OutputBoolean writesignal;  
OutputReal inputdata[1]; 
InputBoolean spaceavailable;


Xdtmc Xsys;
Udtmc Usys;


equation

connect(Xsys.U, Usys.U);

connect(Xsys.X0, X0);
connect(Xval, Xsys.X);

inputdata[1] = Xsys.X;


algorithm

when initial() then

writesignal := false;

// takes two samples sending to fifo, thus at most T/2.
// The smaller this sampling time, the smaller the communication delay
elsewhen sample(0, Prm.T/2) then

// read data from env and send to fifo,
// data dropped if there is no space in fifo

if pre(spaceavailable)
then  // send curent value of X to fifo
      writesignal := not(pre(writesignal));
end if;

end when;



end Env;

