------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena los datos de sus empleados en una tabla denominada "empleados" y en una tabla "control", el nombre del usuario y la fecha, cada vez que se ingresa un nuevo registro en la tabla "empleados".

Elimine las tablas:

 drop table empleados;
 drop table control;
 
Cree las tablas con las siguientes estructuras:

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  seccion varchar2(20)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );

1. Cree un disparador que se dispare una vez por cada registro ingresado en "empleados"; el trigger debe ingresar en la tabla "control", el nombre del usuario y la fecha en la cual 
se realizó un "insert" sobre "empleados"

    CREATE OR REPLACE TRIGGER TR_INGRESAR_EMPLEADOS
        BEFORE INSERT
        ON EMPLEADOS
        FOR EACH ROW
    BEGIN
        INSERT INTO CONTROL VALUES (USER,SYSDATE);
    END TR_INGRESAR_EMPLEADOS;
    /

2. Vea qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado

    SELECT *
    FROM USER_TRIGGERS 
        WHERE TRIGGER_NAME ='TR_INGRESAR_EMPLEADOS';

3. Ingrese algunos registros en "empleados":

 insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
 insert into empleados values('22999000','FUENTES','Federico','Sistemas');
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria');

4. Verifique que el trigger se disparó 6 veces, una por cada fila afectada en la sentencia "insert" anteriormente ejecutada; consultamos la tabla "control":

 select *
 from control;
 
Si el trigger hubiese sido creado a nivel de sentencia, no de fila, el "insert" anterior se hubiese activado una sola vez aún cuando se ingresaron 6 registros.