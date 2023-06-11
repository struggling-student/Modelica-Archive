
block Controller

InputReal r[3];
InputReal x[3];
InputReal v[3];
OutputReal u[3];

algorithm
    when sample(0, K.T) then
        u[1] := K.k1 * (x[1] - r[1]) + K.k2 * v[1];
        u[2] := K.k1 * (x[2] - r[2]) + K.k2 * v[2];
        u[3] := K.g + K.k1 * (x[3] - r[3]) + K.k2 * v[3];
    end when;

end Controller;

