------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

Un negocio almacena los datos de sus productos en una tabla denominada "productos". Dicha tabla contiene el código de producto, el precio, el stock mínimo que se necesita (cantidad mínima requerida antes de comprar más) y el stock actual (cantidad disponible en depósito). Si el stock actual es cero, es urgente reponer tal producto; menor al stock mínimo requerido, es necesario reponer tal producto; si el stock actual es igual o supera el stock minimo, está en estado normal.

Elimine la tabla "productos":

 drop table productos;
 
Cree la tabla con la siguiente estructura:

 create table productos(
  codigo number(5),
  precio number(6,2),
  stockminimo number(4),
  stockactual number(4)
 );

 Ingrese algunos registros:

 insert into productos values(100,10,100,200);
 insert into productos values(102,15,200,500);
 insert into productos values(130,8,100,0);
 insert into productos values(240,23,100,20);
 insert into productos values(356,12,100,250);
 insert into productos values(360,7,100,100);
 insert into productos values(400,18,150,100);

1. Cree una función que reciba dos valores numéricos correspondientes a ambos stosks. Debe comparar ambos stocks y retornar una cadena de caracteres indicando el estado de cada producto,
si stock actual es:

 - cero: "faltante",
 - menor al stock mínimo: "reponer",
 - igual o superior al stock mínimo: "normal".
 
 CREATE OR REPLACE FUNCTION  F_ESTADOSTOCKS (ASTOCKACTUAL NUMBER , ASTOCKMINIMO NUMBER)
        RETURN VARCHAR2
    IS
        ESTADO VARCHAR2(20);
    BEGIN
        ESTADO:= 'NORMAL';
            IF ASTOCKACTUAL >= ASTOCKMINIMO THEN
                ESTADO:= 'NORMAL';
            ELSE
                IF ASTOCKACTUAL = 0 THEN
                    ESTADO := 'FALTANTE';
                ELSE
                    ESTADO := 'REPONER';
                END IF;
            END IF;
            
            RETURN ESTADO;
    END;
    /
        
 
2. Realice un "select" mostrando el código del producto, ambos stocks y, empleando la función creada anteriormente, una columna que muestre el estado del producto

 SELECT CODIGO , STOCKACTUAL, STOCKMINIMO , F_ESTADOSTOCKS(STOCKACTUAL,STOCKMINIMO) "ESTADO DE PRODUCTOS"
 FROM PRODUCTOS;

3. Realice la misma función que en el punto 1, pero esta vez empleando en la estructura condicional la sintaxis "if... elsif...end if"

 CREATE OR REPLACE FUNCTION F_ESTADOSTOCKS (ASTOCKACTUAL NUMBER,ASTOCKMINIMO NUMBER)
        RETURN VARCHAR2
    IS
        ESTADO VARCHAR2(20);
    BEGIN
        ESTADO := 'NORMAL';
            IF ASTOCKACTUAL >= ASTOCKMINIMO THEN
                ESTADO := 'NORMAL';
            ELSIF
                ASTOCKACTUAL=0 THEN
                    ESTADO := 'FALTANTE';
            ELSE
                ESTADO:= 'REPONER';
            END IF;
        
        RETURN ESTADO;
    END;
    /

4. Realice un "select" mostrando el código del producto, ambos stocks y, empleando la función creada anteriormente, una columna que muestre el estado del producto

 SELECT CODIGO , STOCKACTUAL, STOCKMINIMO , F_ESTADOSTOCKS(STOCKACTUAL,STOCKMINIMO) "ESTADO DE PRODUCTOS"
 FROM PRODUCTOS;

5. Realice una función similar a las anteriores, pero esta vez, si el estado es "reponer" o "faltante", debe especificar la cantidad necesaria (valor necesario para llegar al stock mínimo)

 CREATE OR REPLACE FUNCTION F_ESTADOSTOCKS (ASTOCKACTUAL NUMBER,ASTOCKMINIMO NUMBER)
        RETURN VARCHAR2
    IS
        ESTADO VARCHAR2(20);
    BEGIN
        ESTADO := 'NORMAL';
            IF ASTOCKACTUAL >= ASTOCKMINIMO THEN
                ESTADO := 'NORMAL';
            ELSIF
                ASTOCKACTUAL=0 THEN
                    ESTADO := 'FALTANTE'  || ' ' ||  (ASTOCKMINIMO); -- TAMBIEN VALDRIA TO_CHAR (ASTOCKMINIMO)
            ELSE
                ESTADO := 'REPONER' || ' ' || (ASTOCKMINIMO-ASTOCKACTUAL); -- TAMBIEN VALDRIA TO_CHAR (ASTOCKMINIMO-ASTOCKACTUAL)
            END IF;
            
        RETURN ESTADO;
    END;
    /
                    
 
6. Realice un "select" mostrando el código del producto, ambos stocks y, empleando la función creada anteriormente, una columna que muestre el estado del producto

 SELECT CODIGO , STOCKACTUAL, STOCKMINIMO , F_ESTADOSTOCKS(STOCKACTUAL,STOCKMINIMO) "ESTADO DE PRODUCTOS"
 FROM PRODUCTOS;