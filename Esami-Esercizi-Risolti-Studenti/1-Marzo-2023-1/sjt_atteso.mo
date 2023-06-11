function sjt_atteso
    input Integer i;          
    input Integer k;            

    output Real sjt_a;

    algorithm

        // Formula sulla specifica
        sjt_a := Prm.A + (Prm.B*k*k) + (Prm.C*i*i) + (Prm.D*k*i);


end sjt_atteso;
