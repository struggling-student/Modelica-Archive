
function myrandom
//input Integer seed;
output Real result;

external "C" result = myrandom();

  annotation(Include = "#include \"myextlib.c\"");


end myrandom;