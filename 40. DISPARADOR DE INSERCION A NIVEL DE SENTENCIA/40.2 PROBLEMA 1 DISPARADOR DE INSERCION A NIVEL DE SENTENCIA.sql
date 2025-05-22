------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y controla las acciones que los empleados realizan sobre dicha tabla almacenando en la tabla "control" 
el nombre del usuario y la fecha, cada vez que se ingresa un registro en la tabla "libros".

Eliminamos la tabla:

 drop table libros;
 
Creamos la tabla con la siguiente estructura:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  precio number(6,2)
 );
 
Creamos la tabla "control", antes la eliminamos:

 drop table control;
 
 create table control(
  usuario varchar2(30),
  fecha date
 );
 
1. Creamos un disparador que se dispare cada vez que se ingrese un registro en "libros"; el trigger debe ingresar en la tabla "control", el nombre del usuario, la fecha y la hora 
en la cual se realizó un "insert" sobre "libros":

    CREATE OR REPLACE TRIGGER TR_INGRESAR_LIBROS
        BEFORE INSERT
            ON LIBROS
        BEGIN 
            INSERT INTO CONTROL VALUES (USER,SYSDATE);
        END TR_INGRESAR_LIBROS;
        /
        

1.1 Establecemos el formato de fecha para que muestre "DD/MM/YYYY HH24:MI":

    ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
    
1.2 Veamos qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado:

    SELECT *
    FROM USER_TRIGGERS
        WHERE TRIGGER_NAME='TR_INGRESAR_LIBROS';

 - trigger_name: nombre del disparador;

 - trigger_type: momento y nivel, en este caso es un desencadenador "before" y a nivel de sentencia (statement);

 - triggering_event: evento que lo dispara, en este caso, "insert";

 - base_object_type: a qué objeto está asociado, puede ser una tabla o una vista, en este caso, una tabla (table);

 - table_name: nombre de la tabla al que está asociado (libros);
 
1.3 Ingresamos un registro en "libros":

  insert into libros values(100,'Uno','Richard Bach',25);

1.4 Verificamos que el trigger se disparó consultando la tabla "control" para ver si tiene un nuevo registro:

    SELECT *
    FROM CONTROL;
    
1.5 Ingresamos dos registros más en "libros":

    insert into libros values(150,'Matematica estas ahi','Paenza',12);
    insert into libros values(185,'El aleph','Borges',42);

1.6 Verificamos que el trigger se disparó consultando la tabla "control" para ver si tiene dos nuevos registros:
    
    SELECT *
    FROM CONTROL;
