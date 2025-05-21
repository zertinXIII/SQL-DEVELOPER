------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".

 Elimine la tabla y créela con la siguiente estructura:

 drop table empleados;
 
 create table empleados(
  nombre varchar2(40),
  sueldo number(6,2)
 );

Ingrese algunos registros:

 insert into empleados values('Acosta Ana',550); 
 insert into empleados values('Bustos Bernardo',850); 
 insert into empleados values('Caseros Carolina',900); 
 insert into empleados values('Dominguez Daniel',490); 
 insert into empleados values('Fuentes Fabiola',820); 
 insert into empleados values('Gomez Gaston',740); 
 insert into empleados values('Huerta Hernan',1050); 
 
1. Muestre la suma total de todos los sueldos realizando un "select" (5400)

 SELECT SUM(SUELDO)
 FROM EMPLEADOS;

2. Se necesita incrementar los sueldos en forma proporcional, en un 10% cada vez y controlar que la suma total de sueldos no sea menor a $7000, si lo es, 
el bucle debe continuar y volver a incrementar los sueldos, en caso de superarlo, se saldrá del ciclo repetitivo; es decir, este bucle continuará el incremento de sueldos 
hasta que la suma de los mismos llegue o supere los 7000.

    DECLARE
        TOTAL NUMBER;
    BEGIN
        LOOP
            UPDATE EMPLEADOS SET SUELDO=SUELDO+(SUELDO*0.1); -- 1º
            SELECT SUM(SUELDO) INTO TOTAL -- 2º
            FROM EMPLEADOS;
            EXIT WHEN TOTAL>7000; --3º
        END LOOP;
    END;
    /

3. Verifique que los sueldos han sido incrementados y la suma de todos los sueldos es superior a 7000

 SELECT NOMBRE,SUELDO 
 FROM EMPLEADOS;
 
 SELECT SUM(SUELDO)
 FROM EMPLEADOS;

4. Muestre el sueldo máximo realizando un "select"

 SELECT MAX(SUELDO)
 FROM EMPLEADOS;

5. Se necesita incrementar los sueldos en forma proporcional, en un 5% cada vez y controlar que el sueldo máximo alcance o supere los $1600, al llegar o superarlo, el bucle debe finalizar.
Incluya una variable contador que cuente cuántas veces se repite el bucle

    SET SERVEROUTPUT ON;
    EXECUTE DBMS_OUTPUT.ENABLE(20000);
    
    DECLARE
        MAXIMO NUMBER;
        CONTADOR NUMBER:=0;
    BEGIN
        LOOP
            UPDATE EMPLEADOS SET SUELDO =SUELDO+(SUELDO*0.05);
            CONTADOR:=CONTADOR+1;
            SELECT MAX(SUELDO) INTO MAXIMO
                FROM EMPLEADOS;
            EXIT WHEN MAXIMO>1600;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE(CONTADOR);
    END;
    /
            
6. Verifique que los sueldos han sido incrementados y el sueldo máximo es igual o superior a 1600

 SELECT NOMBRE,SUELDO 
 FROM EMPLEADOS;
 
 SELECT SUM(SUELDO)
 FROM EMPLEADOS;

7. Muestre el sueldo mínimo realizando un "select"

 SELECT MIN(SUELDO)
 FROM EMPLEADOS;

8. Se necesita incrementar los sueldos en forma proporcional, en un 10% cada vez y controlar que el sueldo mínimo no supere los $900. Emplee la sintaxis "if CONDICION then exit"

    DECLARE
        MINIMO NUMBER;
    BEGIN
        LOOP
            SELECT MIN(SUELDO) INTO MINIMO 
                FROM EMPLEADOS;
            IF (MINIMO+MINIMO*0.1>900) THEN EXIT;
            ELSE
                UPDATE EMPLEADOS SET SUELDO=SUELDO+(SUELDO*0.1);
            END IF;
        END LOOP;
    END;
    /            

9. Muestre el sueldo mínimo realizando un "select"

    SELECT MIN(SUELDO)
    FROM EMPLEADOS;