------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena los datos de sus empleados en una tabla denominada "empleados" y en otra llamada "control" guarda un registro por cada vez que un empleado actualiza
datos sobre la tabla "empleados".

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
 
1. Cree un disparador a nivel de sentencia, que se dispare cada vez que se actualicen registros en "empleados"; el trigger debe ingresar en la tabla "control", el nombre del usuario 
y la fecha en la cual se realizó un "update" sobre "empleados"

    CREATE OR REPLACE TRIGGER TR_ACTUALIZAR_EMPLEADOS
        BEFORE UPDATE
        ON EMPLEADOS
    BEGIN
        INSERT INTO CONTROL VALUES (USER,SYSDATE);
    END TR_ACTUALIZAR_EMPLEADOS;
    /

2. Vea qué informa el diccionario "user_triggers" respecto del trigger anteriormente creado

    SELECT *
    FROM USER_TRIGGERS 
        WHERE TRIGGER_NAME='TR_ACTUALIZAR_EMPLEADOS';
    
3. Actualice un registro en "empleados":

    update 
        empleados set nombre='Graciela' 
            where documento='23444555';

4. Vea si el trigger se disparó consultando la tabla "control"

    SELECT *
    FROM CONTROL;

5.  Actualice varios registros de "empleados" en una sola sentencia

    UPDATE 
        EMPLEADOS SET SUELDO=SUELDO+SUELDO*0.1
            WHERE SECCION='Secretaria';

6. Vea si el trigger se disparó consultando la tabla "control"

    SELECT *
    FROM CONTROL;

Note que se modificaron 2 registros de "empleados", pero como la modificación se realizó con una sola sentencia "update" y el trigger es a nivel de sentencia, se agregó solamente 
una fila a la tabla "control"; si el trigger hubiese sido creado a nivel de fila, la sentencia anterior, hubiese disparado el trigger 2 veces y habría ingresado en "control" 2 filas.