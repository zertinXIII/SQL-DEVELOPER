------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

1. Con la estructura repetitiva "for... loop" que vaya del 1 al 20, muestre los números pares.
Dentro del ciclo debe haber una estructura condicional que controle que el número sea par y si lo es, lo imprima por pantalla.

    SET SERVEROUTPUT ON; -- Activa la visualización de mensajes de salida en la consola.
    EXECUTE DBMS_OUTPUT.ENABLE(20000); -- Habilita el buffer de salida con un tamaño específico. Parámetro (20000):
    
    BEGIN
        FOR NUMERO IN 1..20 LOOP
            IF MOD(NUMERO,2)=0 THEN -- calcula el resto de la división de numero entre 2, es decir, SERAN TODOS LOS NUMEROS PARES.
                DBMS_OUTPUT.PUT_LINE(NUMERO);
            END IF;
        END LOOP;
    END;
    /
            
2. Con la estructura repetitiva "for... loop" muestre la sumatoria del número 5; la suma de todos los números del 1 al 5. Al finalizar el ciclo debe mostrarse por pantalla la sumatoria de 5 (15)

    SET SERVEROUTPUT ON; -- Activa la visualización de mensajes de salida en la consola.

    DECLARE 
        SUMATORIA NUMBER:=0;
        BEGIN
            FOR NUMERO IN 1..5 LOOP
                SUMATORIA:=SUMATORIA+NUMERO;
            END LOOP;
            
            DBMS_OUTPUT.PUT_LINE('La sumatoria de 1 a 5 es: ' || SUMATORIA);
        END;
        /

3. Cree una función que reciba un valor entero y retorne el factorial de tal número; el factorial se obtiene multiplicando el valor que recibe por el anterior hasta llegar a multiplicarlo por uno)

    SET SERVEROUTPUT ON; -- Activa la visualización de mensajes de salida en la consola.

    CREATE OR REPLACE FUNCTION F_FACTORIAL(AVALOR NUMBER) -- recibe un valor entero, que será del cual calcularemos su factorial
        RETURN NUMBER -- Retorna el factorial del numero
    IS
        VALORRETORNADO NUMBER:=1; -- variable para comenzar
    BEGIN
        FOR F IN REVERSE 1..AVALOR LOOP
            VALORRETORNADO:=VALORRETORNADO*F;
        END LOOP;
        
        RETURN VALORRETORNADO;
    END;
    /

3.1. Llame a la función creada anteriormente y obtenga el factorial de 5 y de 4 (120 y 24)

    SELECT F_FACTORIAL(5)
    FROM DUAL;
    
    SELECT F_FACTORIAL(4)
    FROM DUAL;

4. Cree un procedimiento que reciba dos parámetros numéricos; el procedimiento debe mostrar la tabla de multiplicar del número enviado como primer argumento, desde el 1 hasta el número 
enviado como segundo argumento. Emplee "for"

    CREATE OR REPLACE PROCEDURE PARAM_TAB_MUL (ANUMERO NUMBER,ALIMITE NUMBER)
        AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('TABLA DEL ' || TO_CHAR(ANUMERO));
        
        FOR F IN 1..ALIMITE LOOP
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(ANUMERO)||'x'||TO_CHAR(F)||'='||TO_CHAR(F*ANUMERO));
        END LOOP;
    END;
    /

4.1 Ejecute el procedimiento creado anteriormente enviándole los valores necesarios para que muestre la tabla del 6 hasta el 20

    EXECUTE PARAM_TAB_MUL(6,20);

4.2 Ejecute el procedimiento creado anteriormente enviándole los valores necesarios para que muestre la tabla del 9 hasta el 10

    EXECUTE PARAM_TAB_MUL(9,10);
