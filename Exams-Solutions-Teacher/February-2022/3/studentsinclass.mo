
function NumStudentInClass
input Boolean DB[K.N, K.Q, K.W];  // DB
input Integer i;  // class
input Integer j;  // j  time slot
output Integer count;   // number of students in the same class j

algorithm

count := 0;

for n in 1:K.N loop
	    if DB[n, i, j] then count := count + 1; end if;
end for;

end NumStudentInClass;