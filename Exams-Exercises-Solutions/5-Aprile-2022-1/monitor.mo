block Monitor

InputReal C;
InputReal v_ref;  

OutputReal e;


algorithm
    when sample(0, Prm.T) then
        e := C - v_ref; // errore
        //e := 1;
    end when;

end Monitor;

