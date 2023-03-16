
function Next
  input Prm q;
  input Integer k;  
  input Integer i;  
  output Integer j; 

  protected
  Real p, y;

  algorithm

    p := myrandom();      
    j := 1;               
    y := P(q, k, i, j);   

    
    while ((p > y) and (j < q.N)) loop

      j := j + 1;                 
      y := y + P(q, k, i, j);     

    end while;

   

end Next;