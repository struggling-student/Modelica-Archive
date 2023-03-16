
block Monitor

InputReal ValueFromServer;  // from client
InputReal ValueMobAvg;     // from client
InputReal AnomalySignal;   // from anomaly detection signal

OutputReal y;  // Monitor Signal
               // There might be inevitable glitches in property.
	       // This we use fading, rather than sustain as required.
	       // Using sustain is also ok, but there will be glitches.

Boolean error;

initial equation
y = 0;

equation

error =
((ValueFromServer < 0.8*ValueMobAvg) and
 (AnomalySignal >= 0)
)
or
((ValueFromServer > 1.2*ValueMobAvg) and
 (AnomalySignal <= 0)
)
or
((ValueFromServer >= 0.8*ValueMobAvg) and
 (ValueFromServer <= 1.2*ValueMobAvg) and
 (AnomalySignal <> 0)
);


equation

when edge(error)  then
      reinit(y, 1);
end when;


der(y) = -2*y;


end Monitor;

