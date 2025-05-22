------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

Mostramos la tabla del 3 hasta el 5. 

En primer lugar activamos el paquete "dbms_output" para poder emplear los procedimientos de dicho paquete, 
luego ejecutamos el procedimiento "dbms_output.enable" para habilitar las llamadas a los procedimientos y funciones de tal paquete, así podremos emplear la función de salida "dbms_output.put_line".

 set serveroutput on;
 execute dbms_output.enable (1000000);
 
Luego, declaramos la variable numérica "numero" y le asignamos el valor cero; tal variable contendrá el multiplicando. 
También declaramos la variable "resultado" de tipo numérico que almacenará el resultado de cada multiplicación. Comenzamos el bloque "begin... end" con la estructura repetitiva "while... loop". 

La condición chequea si el valor de la variable "numero" es menor o igual a 5; las sentencias que se repetirán serán:

    - multiplicar "numero" por 3 y asignárselo a "resultado",

    - imprimir "resultado" e

    - incrementar la variable "numero" para que la siguiente vez que se entre al bucle repetitivo se multiplique 3 por otro número.

1. MOSTRAR LA TABLA DEL 3 , PERO SOLO HASTA EL NUMERO 5.

    set serveroutput on;
    execute dbms_output.enable (1000000);
    
    DECLARE
        NUMERO NUMBER:=0;
        RESULTADO NUMBER;
    BEGIN
        WHILE NUMERO<=5 LOOP
            RESULTADO := 3*NUMERO;
            
            DBMS_OUTPUT.PUT_LINE('3*'|| TO_CHAR(NUMERO)||'='||TO_CHAR(RESULTADO));
            NUMERO:= NUMERO+1;
        END LOOP;
    END;
    /
    