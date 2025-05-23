------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y controla las acciones que los empleados realizan sobre dicha tabla almacenando en la tabla "control" el nombre del usuario y la fecha, cada vez que se elimina un registro de la tabla "libros".

Eliminamos la tabla "libros" y la tabla "control":

 drop table libros;
 drop table control;
 
Creamos las tablas con las siguientes estructuras:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );
 
Ingresamos algunos registros en "libros":

 insert into libros values(97,'Uno','Richard Bach','Planeta',25);
 insert into libros values(98,'El aleph','Borges','Emece',28);
 insert into libros values(99,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(100,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(101,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 insert into libros values(102,'El experto en laberintos','Gaskin','Planeta',20);
 
1. Establecemos el formato de fecha para que muestre "DD/MM/YYYY HH24:MI":

    ALTER SESSION SET NLS_DATE_FORMAT= 'DD/MM/YYYY HH24:MI';

2. Creamos un disparador a nivel de fila, que se dispare cada vez que se borre un registro de "libros"; el trigger debe ingresar en la tabla "control", 
el nombre del usuario, la fecha y la hora en la cual se realizó un "delete" sobre "libros"

    CREATE OR REPLACE TRIGGER TR_BORRAR_LIBROS
        BEFORE  DELETE
        ON LIBROS
        FOR EACH ROW
    BEGIN 
        INSERT INTO CONTROL VALUES (USER,SYSDATE);
    END TR_BORRAR_LIBROS;
    /

2.1 Veamos qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado:

    select *
    from user_triggers 
        where trigger_name ='TR_BORRAR_LIBROS';

obtenemos la siguiente información:

    - trigger_name: nombre del disparador;

    - trigger_type: momento y nivel, en este caso es un desencadenador "before" y a nivel de fila (each row);

    - triggering_event: evento que lo dispara, en este caso, "delete";

    - base_object_type: a qué objeto está asociado, puede ser una tabla o una vista, en este caso, una tabla (table);

    - table_name: nombre de la tabla al que está asociado (libros);

    - y otras columnas que no analizaremos por el momento.

3. Eliminamos todos los libros cuyo código sea inferior a 100:

    DELETE 
    FROM LIBROS
        WHERE CODIGO<100;
        
3.1 Veamos si el trigger se disparó consultando la tabla "control":

    SELECT *
    FROM CONTROL;

4. Reemplazamos el disparador creado anteriormente por otro con igual código pero a nivel de sentencia:

    CREATE OR REPLACE TRIGGER TR_BORRAR_LIBROS
        BEFORE DELETE 
        ON LIBROS
    BEGIN
        INSERT INTO CONTROL VALUES (USER,SYSDATE);
    END TR_BORRAR_LIBROS;
    /
    

4.1 Veamos qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado:

    select *
    from user_triggers 
        where trigger_name ='TR_BORRAR_LIBROS';

5. Eliminamos todos los libros cuya editorial sea "Planeta":

    DELETE 
    FROM LIBROS
        WHERE EDITORIAL= 'Planeta';

Se han eliminado 2 registros, pero el trigger se ha disparado una sola vez, consultamos la tabla "control":

    SELECT *
    FROM CONTROL;

Si el trigger hubiese sido definido a nivel de fila, se hubiese disparado dos veces.


