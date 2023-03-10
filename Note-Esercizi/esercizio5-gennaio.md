# Esercizio 5 - Gennaio 

## File Principali

### Monitor

<details>
  <summary>Codice</summary>

    ```
    block Monitor

    InputReal x[3];
    InputReal r[3];

    OutputReal e[3];
    OutputBoolean clk;

    algorithm
        when sample(0, K.T) then
            clk := not(pre(clk)); 

            e := x - r; 
        end when;

    end Monitor;
    ```
</details>


### System


## Controller

### File Secondari

### Wind

### User

<details>
  <summary>Code</summary>

</details>