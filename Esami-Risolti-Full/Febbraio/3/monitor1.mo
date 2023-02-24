
block Monitor1

InputInteger u[3];  // reservation request

OutputReal y;  // Expected value of time between requests


Integer counter;    
Boolean request;

initial equation
counter = 0;
y = 0;

equation

request = not((u[1] == 0) and (u[2] == 0) and (u[3] == 0));

algorithm

when edge(request)  then

      counter := counter + 1;
      y := time/counter;

end when;




end Monitor1;

