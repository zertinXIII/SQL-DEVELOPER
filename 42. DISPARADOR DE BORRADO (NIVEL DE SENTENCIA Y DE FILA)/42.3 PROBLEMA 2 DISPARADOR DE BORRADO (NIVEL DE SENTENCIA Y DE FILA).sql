------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena los datos de sus empleados en una tabla denominada "empleados" y en otra llamada "control" guarda un registro por cada empleado que se elimina de la tabla "empleados".

Elimine las tablas:

 drop table empleados;
 drop table control;
 
Cree las tablas con las siguientes estructuras:

 create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );
 
Ingrese algunos registros en "empleados":

 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
 
1. Cree un disparador a nivel de fila, que se dispare cada vez que se borre un registro de "empleados"; el trigger debe ingresar en la tabla "control", el nombre del usuario y la fecha 
en la cual se realizó un "delete" sobre "empleados"

    CREATE OR REPLACE TRIGGER TR_BORRAR_EMPLEADOS
        BEFORE DELETE 
        ON EMPLEADOS
        FOR EACH ROW
    BEGIN
        INSERT INTO CONTROL VALUES(USER,SYSDATE);
    END TR_BORRAR_EMPLEADOS;
    /

2. Vea qué informa el diccionario "user_triggers" respecto del trigger anteriormente creado

    SELECT *
    FROM USER_TRIGGERS 
        WHERE TRIGGER_NAME='TR_BORRAR_EMPLEADOS';

3. Elimine todos los empleados cuyo sueldo supera los $800

    DELETE 
    FROM EMPLEADOS
        WHERE SUELDO>800;

4. Vea si el trigger se disparó consultando la tabla "control"
Se eliminaron 3 registros, como el trigger fue definido a nivel de fila, se disparó 3 veces, una vez por cada registro eliminado. 
Si el trigger hubiese sido definido a nivel de sentencia, se hubiese disparado una sola vez.

    SELECT *
    FROM CONTROL;
    
5. Reemplace el disparador creado anteriormente por otro con igual código pero a nivel de sentencia

  CREATE OR REPLACE TRIGGER TR_BORRAR_EMPLEADOS
        BEFORE DELETE 
        ON EMPLEADOS
    BEGIN
        INSERT INTO CONTROL VALUES(USER,SYSDATE);
    END TR_BORRAR_EMPLEADOS;
    /

6. Vea qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado
en este caso es un desencadenador a nivel de sentencia; en la columna "TRIGGER_TYPE" muestra "BEFORE STATEMENT".

    SELECT *
    FROM USER_TRIGGERS 
        WHERE TRIGGER_NAME='TR_BORRAR_EMPLEADOS';


7. Elimine todos los empleados de la sección "Secretaria"
Se han eliminado 2 registros, pero el trigger se ha disparado una sola vez.

    DELETE 
    FROM EMPLEADOS
        WHERE SECCION='Secretaria';

8. Consultamos la tabla "control"
Si el trigger hubiese sido definido a nivel de fila, se hubiese disparado dos veces.

    SELECT *
    FROM CONTROL;