
block Env

InputReal X0;        // initial value
OutputReal Xval;        // X value


Xdtmc Xsys;
Udtmc Usys;


equation

connect(Xsys.U, Usys.U);

connect(Xsys.X0, X0);
connect(Xval, Xsys.X);

end Env;

